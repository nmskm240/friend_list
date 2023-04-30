import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

class PersonAppService {
  final IPersonFactory _factory;
  final IPersonRepository _repository;

  const PersonAppService(this._factory, this._repository);

  Person createEmpty() {
    return _factory.create("", "", SharedPreferencesHelper.getDefaultIcon());
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

  Future<void> deletePersonById(String id) async {
    await _repository.deleteByID(id);
  }

  Future<Iterable<Person>> getAll() async {
    return _repository.getAll();
  }

  Future<Person> findPersonById(String id) {
    return _repository.findByID(id);
  }

  Future<AnniversaryDto> findAnniversaryById(
    String personId,
    String anniversaryId,
  ) async {
    final person = await _repository.findByID(personId);
    late final Anniversary anniversary;
    try {
      anniversary = person.anniversaries.firstWhere(
        (element) => element.id == anniversaryId,
      );
    } on StateError {
      throw UnregisteredAnniversaryException(anniversaryId);
    }
    return AnniversaryDto(
        id: anniversary.id, name: anniversary.name, date: anniversary.date);
  }

  Future<Iterable<AnniversaryDto>> findAnniversarysByPersonId(
    String personId,
  ) async {
    final person = await _repository.findByID(personId);
    return person.anniversaries.map(
      (e) => AnniversaryDto(id: e.id, name: e.name, date: e.date),
    );
  }
}
