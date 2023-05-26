// ignore_for_file: invalid_annotation_target, prefer_initializing_formals

import 'package:age_calculator/age_calculator.dart';
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

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: Strings.jsonKeyId)
  late final String id;
  @JsonKey(name: Strings.jsonKeyName)
  late String name;
  @JsonKey(name: Strings.jsonKeyNickname)
  late String nickname;
  @Uint8ListField()
  @JsonKey(name: Strings.jsonKeyIcon)
  late Uint8List icon;
  @JsonKey(includeToJson: false)
  late final List<Anniversary> _anniversaries;
  @JsonKey(includeToJson: false)
  late final List<Contact> _contacts;
  @CreatedAtField()
  @JsonKey(name: Strings.jsonKeyCreatedAt)
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: Strings.jsonKeyUpdatedAt)
  late final DateTime updatedAt;

  Person({
    required String id,
    required String name,
    String nickname = "",
    required Uint8List icon,
    List<Anniversary>? anniversaries,
    List<Contact>? contacts,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    this.id = id;
    this.name = name;
    this.nickname = nickname;
    this.icon = icon;
    _anniversaries = anniversaries ?? [];
    _contacts = contacts ?? [];
    this.createdAt = createdAt ?? DateTime.now();
    this.updatedAt = updatedAt ?? DateTime.now();
  }
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @JsonKey(includeToJson: false)
  Iterable<Anniversary> get anniversaries => _anniversaries;
  @JsonKey(includeToJson: false)
  Iterable<Contact> get contacts => _contacts;

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

  void addAnniversary(Anniversary anniversary) {
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
    _anniversaries.add(anniversary);
  }

  void editAnniversary(Anniversary anniversary) {
    if (!anniversary.isValid) {
      throw Exception("不正なデータ");
    }
    if (anniversary.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (!hasSameAnniversaryById(anniversary.id)) {
      throw UnregisteredAnniversaryException(anniversary.id);
    }
    if (anniversary.name == Strings.birthdate) {
      throw Exception("登録できない名称");
    }
    final old = _anniversaries.firstWhere((element) => element.id == id);
    old.name = anniversary.name;
    old.date = anniversary.date;
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

  void removeAnniversary(String id) {
    _anniversaries.removeWhere((element) => element.id == id);
  }

  void addContact(Contact contact) {
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
    _contacts.add(contact);
  }

  void editContact(Contact contact) {
    if (!contact.isValid) {
      throw Exception("不正なデータ");
    }
    if (contact.personId != id) {
      throw Exception("異なるPersonId");
    }
    if (!hasSameContactById(contact.id)) {
      throw UnregisteredContactException(id: contact.id);
    }
    final old = _contacts.firstWhere((element) => element.id == id);
    old.name = contact.name;
    old.method = contact.method;
    old.value = contact.value;
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

  void removeContact(String id) {
    _contacts.removeWhere((element) => element.id == id);
  }
}
