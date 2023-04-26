// ignore_for_file: invalid_annotation_target, prefer_initializing_formals

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/common/exception/duplicate_anniversary_exception.dart';
import 'package:friend_list/common/exception/duplicate_contact_exception.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
import 'package:friend_list/common/exception/unregistered_contact_exception.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/uint8list_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/infrastructure/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/infrastructure/person/contact/contact_factory.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: "id")
  late final String id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "nickname")
  late String nickname;
  @Uint8ListField()
  @JsonKey(name: "icon")
  late Uint8List icon;
  @JsonKey(includeToJson: false)
  late final List<Anniversary> _anniversaries;
  @JsonKey(includeToJson: false)
  late final List<Contact> _contacts;
  @CreatedAtField()
  @JsonKey(name: "created_at")
  late final DateTime createdAt;
  @UpdatedAtField()
  @JsonKey(name: "updated_at")
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
    if (!hasSameAnniversaryByName("birthdate")) {
      throw const UnregisteredAnniversaryException("birthdate");
    }
    final birthdate =
        anniversaries.firstWhere((element) => element.isBirthdate);
    return birthdate.date;
  }

  int get age => AgeCalculator.age(birthdate).years;

  void addAnniversary(String name, DateTime date) {
    if (hasSameAnniversaryByName(name)) {
      throw DuplicateAnniversaryException(id, name);
    }
    final factory = AnniversaryFactory();
    final anniversary = factory.create(name, date, id);
    _anniversaries.add(anniversary);
  }

  void editAnniversary(String id, {String? name, DateTime? date}) {
    if (!hasSameAnniversaryById(id)) {
      throw UnregisteredAnniversaryException(id);
    }
    final index = _anniversaries.indexWhere((element) => element.id == id);
    if (name != null) {
      _anniversaries[index].name = name;
    }
    if (date != null) {
      _anniversaries[index].date = date;
    }
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

  void addContact(String name, ContactMethod method, String value) {
    if (hasSameContactByMethodAndValue(method, value)) {
      throw DuplicateContactException(id, method.name, value);
    }
    final factroy = ContactFactory();
    final contact = factroy.create(name, method, value, id);
    _contacts.add(contact);
  }

  void editContact(
    String id, {
    String? name,
    ContactMethod? method,
    String? value,
  }) {
    if (!hasSameContactById(id)) {
      throw UnregisteredContactException(id: id);
    }
    final index = _contacts.indexWhere((element) => element.id == id);
    if (name != null) {
      _contacts[index].name = name;
    }
    if (method != null) {
      _contacts[index].method = method;
    }
    if (value != null) {
      _contacts[index].value = value;
    }
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
