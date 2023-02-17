// ignore_for_file: invalid_annotation_target, prefer_initializing_formals

import 'dart:convert';
import 'dart:io';

import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/common/exception/duplicate_anniversary_exception.dart';
import 'package:friend_list/common/exception/duplicate_contact_exception.dart';
import 'package:friend_list/common/exception/unregistered_birthdate_exception.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/annotation/created_at_field.dart';
import 'package:friend_list/domain/person/annotation/updated_at_field.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/infrastructure/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/infrastructure/person/contact/contact_factory.dart';
import 'package:quiver/strings.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: "id")
  late final String id;
  @JsonKey(name: "name")
  late String name;
  @JsonKey(name: "nickname")
  late String nickname;
  @JsonKey(name: "icon")
  late String icon;
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
    String icon = "",
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
    if (!hasSameAnniversary("birthdate")) {
      throw UnregisteredBirthdateException(id);
    }
    final birthdate =
        anniversaries.firstWhere((element) => element.name == "birthdate");
    return birthdate.date;
  }

  int? get age => AgeCalculator.age(birthdate).years;

  Future<Uint8List> iconImage() async {
    if (isBlank(icon)) {
      final bytes =
          await rootBundle.loadString("assets/images/default_avatar.png");
      return File(bytes).readAsBytes();
    } else {
      return base64.decode(icon);
    }
  }

  void addAnniversary(String name, DateTime date) {
    if (hasSameAnniversary(name)) {
      throw DuplicateAnniversaryException(id, name);
    }
    final factory = AnniversaryFactory();
    final anniversary = factory.create(name, date, id);
    _anniversaries.add(anniversary);
  }

  bool hasSameAnniversary(String name) {
    return anniversaries.any((element) => element.name == name);
  }

  void removeAnniversary(String id) {
    _anniversaries.removeWhere((element) => element.id == id);
  }

  void addContact(String name, ContactMethod method, String value) {
    if (hasSameContact(method, value)) {
      throw DuplicateContactException(id, method.name, value);
    }
    final factroy = ContactFactory();
    final contact = factroy.create(name, method, value, id);
    _contacts.add(contact);
  }

  bool hasSameContact(ContactMethod method, String value) {
    return contacts
        .any((element) => element.method == method && element.value == value);
  }

  void removeContact(String id) {
    _contacts.removeWhere((element) => element.id == id);
  }
}
