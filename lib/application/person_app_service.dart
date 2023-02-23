import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/application/model/person_summary.dart';
import 'package:friend_list/common/exception/unregistered_birthdate_exception.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

class PersonAppService {
  final IPersonFactory _factory;
  final IPersonRepository _repository;

  const PersonAppService(this._factory, this._repository);

  Person createEmptyPerson(Uint8List defaultIcon) {
    return _factory.create("", "", defaultIcon);
  }

  Future<void> savePerson(
    String name,
    String nickname,
    Uint8List icon,
    List<AnniversaryDto> anniversaries,
    List<ContactDto> contacts,
  ) async {
    final person = _factory.create(name, nickname, icon);
    for (final anniversary in anniversaries) {
      person.addAnniversary(anniversary.name, anniversary.date);
    }
    for (final contact in contacts) {
      person.addContact(contact.name, contact.method, contact.value);
    }
    await _repository.save(person);
  }

  Future<Iterable<PersonSummary>> getAll() async {
    final persons = await _repository.getAll();
    return persons.map((e) {
      late int? age;
      try {
        age = e.age;
      } catch (e) {
        if (e is UnregisteredBirthdateException) {
          age = null;
        }
      }
      return PersonSummary(e.id, e.name, e.nickname, e.icon, age);
    });
  }
}
