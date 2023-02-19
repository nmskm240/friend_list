import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_list/common/exception/nonexistent_person_exception.dart';
import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class PersonRepository implements IPersonRepository {
  final ILocalDataSource source;

  const PersonRepository(this.source);

  @override
  Future<void> attachTags(String id, List<String> tagIds) async {
    final db = await source.database;
    for (final tagId in tagIds) {
      await db.rawInsert('''
        INSERT INTO ${DatabaseTable.registredTags.name} (person_id, tag_id) VALUES (?, ?)
      ''', [
        id,
        tagId,
      ]);
    }
  }

  @override
  Future<void> deleteAll() async {
    final db = await source.database;
    await db.delete(DatabaseTable.persons.name);
  }

  @override
  Future<void> deleteByID(String id) async {
    final db = await source.database;
    await db.delete(
      DatabaseTable.persons.name,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<Person> findByID(String id) async {
    final db = await source.database;
    final searched = await db.rawQuery(
      '''
        SELECT 
        person.id AS person_id, 
        person.name AS person_name, 
        person.nickname AS person_nickname, 
        person.icon AS person_icon, 
        person.created_at AS person_created_at, 
        person.updated_at AS person_updated_at, 
        anniversary.id AS anniversary_id,
        anniversary.name AS anniversary_name,
        anniversary.date AS anniversary_date,
        anniversary.created_at AS anniversary_created_at,
        anniversary.updated_at AS anniversary_updated_at,
        contact.id AS contact_id,
        contact.name AS contact_name,
        contact.method AS contact_method,
        contact.value AS contact_value,
        contact.created_at AS contact_created_at,
        contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
        LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary.person_id 
        LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.id = ?
      ''',
      [id],
    );
    if (searched.isEmpty) {
      throw NonexistentPersonException(id);
    }
    final jsonPerson = searched.first.map<String, dynamic>(
        (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
    final List<Map<String, dynamic>> jsonAnniversaries = [];
    for (final column in searched) {
      final entries = column.entries.where((element) =>
          element.value != null && element.key.contains("anniversary"));
      final json = Map.fromEntries(entries);
      if (jsonAnniversaries
              .every((element) => element["id"] != json["anniversary_id"]) &&
          json.isNotEmpty) {
        json.addAll({"person_id": id});
        final jsonAnniversary = json.map<String, dynamic>((key, value) =>
            MapEntry(key.replaceFirst("anniversary_", ""), value));
        jsonAnniversaries.add(jsonAnniversary);
      }
    }
    final List<Map<String, dynamic>> jsonContatcts = [];
    for (final column in searched) {
      final entries = column.entries.where((element) =>
          element.value != null && element.key.contains("contact"));
      final json = Map.fromEntries(entries);
      if (jsonContatcts
              .every((element) => element["id"] != json["contact_id"]) &&
          json.isNotEmpty) {
        json.addAll({"person_id": id});
        final jsonContatct = json.map<String, dynamic>(
            (key, value) => MapEntry(key.replaceFirst("contact_", ""), value));
        jsonContatcts.add(jsonContatct);
      }
    }
    return Person.fromJson({
      ...jsonPerson,
      "anniversaries": jsonAnniversaries,
      "contacts": jsonContatcts,
    });
  }

  @override
  Future<Iterable<Person>> findByNameOrNickname(String value) async {
    final db = await source.database;
    final searched = await db.rawQuery(
      '''
        SELECT 
        person.id AS person_id, 
        person.name AS person_name, 
        person.nickname AS person_nickname, 
        person.icon AS person_icon, 
        person.created_at AS person_created_at, 
        person.updated_at AS person_updated_at, 
        anniversary.id AS anniversary_id,
        anniversary.name AS anniversary_name,
        anniversary.date AS anniversary_date,
        anniversary.created_at AS anniversary_created_at,
        anniversary.updated_at AS anniversary_updated_at,
        contact.id AS contact_id,
        contact.name AS contact_name,
        contact.method AS contact_method,
        contact.value AS contact_value,
        contact.created_at AS contact_created_at,
        contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
        LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary.person_id 
        LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.name LIKE '%$value%' OR person.nickname LIKE '%$value%'
      ''',
    );
    final personIds = searched.map((e) => e["person_id"] as String).toSet();
    debugPrint(personIds.toString());
    return personIds.map((personId) {
      final personColumns =
          searched.where((column) => column["person_id"] == personId);
      final jsonPerson = personColumns.first.map<String, dynamic>(
          (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
      final List<Map<String, dynamic>> jsonAnniversaries = [];
      for (final column in personColumns) {
        final entries = column.entries.where((element) =>
            element.value != null && element.key.contains("anniversary"));
        final json = Map.fromEntries(entries);
        if (jsonAnniversaries
                .every((element) => element["id"] != json["anniversary_id"]) &&
            json.isNotEmpty) {
          json.addAll({"person_id": personId});
          final jsonAnniversary = json.map<String, dynamic>((key, value) =>
              MapEntry(key.replaceFirst("anniversary_", ""), value));
          jsonAnniversaries.add(jsonAnniversary);
        }
      }
      final List<Map<String, dynamic>> jsonContatcts = [];
      for (final column in personColumns) {
        final entries = column.entries.where((element) =>
            element.value != null && element.key.contains("contact"));
        final json = Map.fromEntries(entries);
        if (jsonContatcts
                .every((element) => element["id"] != json["contact_id"]) &&
            json.isNotEmpty) {
          json.addAll({"person_id": personId});
          final jsonContatct = json.map<String, dynamic>((key, value) =>
              MapEntry(key.replaceFirst("contact_", ""), value));
          jsonContatcts.add(jsonContatct);
        }
      }
      return Person.fromJson({
        ...jsonPerson,
        "anniversaries": jsonAnniversaries,
        "contacts": jsonContatcts,
      });
    });
  }

  @override
  Future<Iterable<Person>> getAll() async {
    final db = await source.database;
    final searched = await db.rawQuery(
      '''
        SELECT 
        person.id AS person_id, 
        person.name AS person_name, 
        person.nickname AS person_nickname, 
        person.icon AS person_icon, 
        person.created_at AS person_created_at, 
        person.updated_at AS person_updated_at, 
        anniversary.id AS anniversary_id,
        anniversary.name AS anniversary_name,
        anniversary.date AS anniversary_date,
        anniversary.created_at AS anniversary_created_at,
        anniversary.updated_at AS anniversary_updated_at,
        contact.id AS contact_id,
        contact.name AS contact_name,
        contact.method AS contact_method,
        contact.value AS contact_value,
        contact.created_at AS contact_created_at,
        contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
        LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary.person_id 
        LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
      ''',
    );
    final personIds = searched.map((e) => e["person_id"] as String).toSet();
    return personIds.map((personId) {
      final personColumns =
          searched.where((column) => column["person_id"] == personId);
      final jsonPerson = personColumns.first.map(
          (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
      final List<Map<String, dynamic>> jsonAnniversaries = [];
      for (final column in personColumns) {
        final entries = column.entries.where((element) =>
            element.value != null && element.key.contains("anniversary"));
        final json = Map.fromEntries(entries);
        if (jsonAnniversaries
                .every((element) => element["id"] != json["anniversary_id"]) &&
            json.isNotEmpty) {
          json.addAll({"person_id": personId});
          final jsonAnniversary = json.map<String, dynamic>((key, value) =>
              MapEntry(key.replaceFirst("anniversary_", ""), value));
          jsonAnniversaries.add(jsonAnniversary);
        }
      }
      final List<Map<String, dynamic>> jsonContatcts = [];
      for (final column in personColumns) {
        final entries = column.entries.where((element) =>
            element.value != null && element.key.contains("contact"));
        final json = Map.fromEntries(entries);
        if (jsonContatcts
                .every((element) => element["id"] != json["contact_id"]) &&
            json.isNotEmpty) {
          json.addAll({"person_id": personId});
          final jsonContatct = json.map<String, dynamic>((key, value) =>
              MapEntry(key.replaceFirst("contact_", ""), value));
          jsonContatcts.add(jsonContatct);
        }
      }
      print(personColumns.first);
      return Person.fromJson({
        ...jsonPerson,
        "anniversaries": jsonAnniversaries,
        "contacts": jsonContatcts,
      });
    });
  }

  @override
  Future<Iterable<String>> getAttachedTagIDs(String id) async {
    final db = await source.database;
    final searched = await db.query(
      DatabaseTable.registredTags.name,
      where: "id = ?",
      whereArgs: [id],
    );
    return searched.map((e) => e["tag_id"].toString());
  }

  @override
  Future<void> removeTags(String id, List<String> tagIds) async {
    final db = await source.database;
    for (final tagId in tagIds) {
      await db.rawDelete('''
        DELETE FROM ${DatabaseTable.registredTags.name} WHERE id = ? AND tag_id = ?
      ''', [id, tagId]);
    }
  }

  @override
  Future<Person> save(Person person) async {
    final db = await source.database;
    await db.rawInsert(
      '''
        INSERT OR REPLACE INTO ${DatabaseTable.persons.name} (
          id,
          name,
          nickname,
          icon,
          created_at,
          updated_at
        ) VALUES (?, ?, ?, ?, ?, ?)
      ''',
      person.toJson().values.toList(),
    );
    for (final anniversary in person.anniversaries) {
      await db.rawInsert(
        '''
          INSERT OR REPLACE INTO ${DatabaseTable.anniversaries.name} (
            id,
            name,
            date,
            person_id,
            created_at,
            updated_at
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''',
        anniversary.toJson().values.toList(),
      );
    }
    for (final contact in person.contacts) {
      await db.rawInsert(
        '''
          INSERT OR REPLACE INTO ${DatabaseTable.contacts.name} (
            id,
            name,
            method,
            value,
            person_id,
            created_at,
            updated_at
          ) VALUES (?, ?, ?, ?, ?, ? ,?)
        ''',
        contact.toJson().values.toList(),
      );
    }
    return person;
  }
}
