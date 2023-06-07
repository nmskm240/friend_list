// ignore_for_file: invalid_annotation_target, prefer_initializing_formals

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/common/exception/duplicate_anniversary_exception.dart';
import 'package:friend_list/common/exception/duplicate_contact_exception.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
import 'package:friend_list/common/exception/unregistered_contact_exception.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/uint8list_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';
import 'package:friend_list/domain/person/contact/contact.dart';

part "person.freezed.dart";
part 'person.g.dart';

@freezed
class Person with _$Person {
  const Person._();
  const factory Person({
    @JsonKey(name: Strings.jsonKeyId) required String id,
    @JsonKey(name: Strings.jsonKeyName) required String name,
    @JsonKey(name: Strings.jsonKeyNickname) @Default("") String nickname,
    @Uint8ListField()
    @JsonKey(name: Strings.jsonKeyIcon)
        required Uint8List icon,
    @JsonKey(includeToJson: false)
    @Default(<Anniversary>[])
        List<Anniversary> anniversaries,
    @JsonKey(includeToJson: false) @Default(<Contact>[]) List<Contact> contacts,
    @CreatedAtField()
    @JsonKey(name: Strings.jsonKeyCreatedAt)
        DateTime? createdAt,
    @UpdatedAtField()
    @JsonKey(name: Strings.jsonKeyUpdatedAt)
        DateTime? updatedAt,
  }) = _Person;
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  DateTime get birthdate {
    if (!hasSameAnniversaryByName(Strings.birthdate)) {
      throw const UnregisteredAnniversaryException(Strings.birthdate);
    }
    final birthdate =
        anniversaries.firstWhere((element) => element.isBirthdate);
    return birthdate.date;
  }

  bool get hasBirthdate {
    return hasSameAnniversaryByName(Strings.birthdate);
  }

  int? get age {
    if (hasBirthdate) {
      return AgeCalculator.age(birthdate).years;
    } else {
      return null;
    }
  }

  Person addAnniversary(Anniversary anniversary) {
    if (!anniversary.isValid) {
      throw Exception("不正なデータ");
    }
    if (anniversary.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (hasSameAnniversaryByName(anniversary.name) ||
        hasSameAnniversaryById(anniversary.id)) {
      throw DuplicateAnniversaryException(anniversary.id, anniversary.name);
    }
    if (anniversary.name == Strings.birthdate) {
      throw Exception("登録できない名称");
    }
    return copyWith(anniversaries: [...anniversaries, anniversary]);
  }

  /// [edited]と同じIDを持つ要素を[edited]の内容に置き換える
  /// 
  /// [Person]がimmutableなため、[Person.anniversaries]は書き変わらない
  /// 
  /// 返り値：置き換え後の[anniversaries]
  Iterable<Anniversary> editAnniversary(Anniversary edited) {
    if (!edited.isValid) {
      throw Exception("不正なデータ");
    }
    if (edited.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (!hasSameAnniversaryById(edited.id)) {
      throw UnregisteredAnniversaryException(edited.id);
    }
    if (edited.name == Strings.birthdate) {
      throw Exception("登録できない名称");
    }
    return anniversaries.map((e) => e.id == edited.id ? edited : e);
  }

  bool hasSameAnniversaryById(String id) {
    return anniversaries.any((element) => element.id == id);
  }

  bool hasSameAnniversaryByName(String name) {
    return anniversaries.any((element) => element.name == name);
  }

  Anniversary findAnniversaryById(String id) {
    if (!hasSameAnniversaryById(id)) {
      throw UnregisteredAnniversaryException(id);
    }
    return anniversaries.firstWhere((element) => element.id == id);
  }

  Anniversary findAnniversaryByName(String name) {
    if (!hasSameAnniversaryByName(name)) {
      throw UnregisteredAnniversaryException(name);
    }
    return anniversaries.firstWhere((element) => element.name == name);
  }

  Person removeAnniversary(String id) {
    var copy = List<Anniversary>.from(anniversaries);
    copy.removeWhere((element) => element.id == id);
    return copyWith(anniversaries: copy);
  }

  Person addContact(Contact contact) {
    if (!contact.isValid) {
      throw Exception("不正なデータ");
    }
    if (contact.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (hasSameContactById(contact.id) ||
        hasSameContactByMethodAndValue(contact.method, contact.value)) {
      throw DuplicateContactException(id, contact.method.name, contact.value);
    }
    return copyWith(contacts: [...contacts, contact]);
  }

  Person editContact(Contact edited) {
    if (!edited.isValid) {
      throw Exception("不正なデータ");
    }
    if (edited.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (!hasSameContactById(edited.id)) {
      throw UnregisteredContactException(id: edited.id);
    }
    final old = contacts.firstWhere((element) => element.id == id);
    final index = contacts.indexOf(old);
    contacts.remove(old);
    contacts.insert(index, edited);
    return copyWith(contacts: [...contacts]);
  }

  bool hasSameContactById(String id) {
    return contacts.any((element) => element.id == id);
  }

  bool hasSameContactByMethodAndValue(ContactMethod method, String value) {
    return contacts
        .any((element) => element.method == method && element.value == value);
  }

  Contact findContactById(String id) {
    if (!hasSameContactById(id)) {
      throw UnregisteredContactException(id: id);
    }
    return contacts.firstWhere((element) => element.id == id);
  }

  Contact findContactByMethodAndValue(ContactMethod method, String value) {
    if (!hasSameContactByMethodAndValue(method, value)) {
      throw UnregisteredContactException(method: method.name, value: value);
    }
    return contacts.firstWhere(
        (element) => element.method == method && element.value == value);
  }

  Person removeContact(String id) {
    var copy = List<Contact>.from(contacts);
    copy.removeWhere((element) => element.id == id);
    return copyWith(contacts: copy);
  }
}
