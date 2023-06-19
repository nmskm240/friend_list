import 'dart:collection';
import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:friend_list/common/exception/unregistered_person_exception.dart';
import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class PersonRepository implements IPersonRepository {
  final ILocalDataSource source;

  const PersonRepository(this.source);

  @protected
  Iterable<Map<String, dynamic>?> convertToJson(
    Iterable<Map<String, Object?>> columns,
    String prefix, {
    String additionalKey = "",
  }) {
    final List<Map<String, dynamic>?> unique = [];
    columns
        .map((column) {
          final entries = column.entries.where((element) =>
              element.value != null && element.key.contains(prefix));
          final map = Map.fromEntries(entries);
          if (map.isEmpty) return null;
          if (column.containsKey(additionalKey)) {
            map[additionalKey] = column[additionalKey];
          }
          if (prefix == "anniversary") {
            map["reminds"] = convertToJson(
                columns.where((element) =>
                    element["anniversary_id"] == map["anniversary_id"]),
                "notification",
                additionalKey: "anniversary_id");
          }
          final json = map.map<String, dynamic>((key, value) =>
              MapEntry(key.replaceFirst("${prefix}_", ""), value));
          return json;
        })
        .where((json) => json != null)
        .forEach((json) {
          if (unique.every((element) => element!["id"] != json!["id"])) {
            unique.add(json);
          }
        });
    return unique;
  }

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
          anniversary.person_id AS anniversary_person_id,
          anniversary.created_at AS anniversary_created_at, 
          anniversary.updated_at AS anniversary_updated_at, 
          notification.timing AS notification_timing, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.notifications.name} AS notification ON anniversary.id = notification.anniversary_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.id = ?
      ''',
      [id],
    );
    if (searched.isEmpty) {
      throw UnregisteredPersonException(id);
    }
    final json = searched.first.map<String, dynamic>(
        (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
    return Person.fromJson({
      ...json,
      "anniversaries":
          convertToJson(searched, "anniversary", additionalKey: "person_id"),
      "contacts":
          convertToJson(searched, "contact", additionalKey: "person_id"),
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
          anniversary.person_id AS anniversary_person_id,
          anniversary.created_at AS anniversary_created_at, 
          anniversary.updated_at AS anniversary_updated_at, 
          notification.timing AS notification_timing, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.notifications.name} AS notification ON anniversary.id = notification.anniversary_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.name LIKE '%$value%' OR person.nickname LIKE '%$value%'
      ''',
    );
    final personIds = searched.map((e) => e["person_id"] as String).toSet();
    return personIds.map((personId) {
      final columns =
          searched.where((column) => column["person_id"] == personId);
      final json = columns.first.map<String, dynamic>(
          (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
      return Person.fromJson({
        ...json,
        "anniversaries":
            convertToJson(columns, "anniversary", additionalKey: "person_id"),
        "contacts":
            convertToJson(columns, "contact", additionalKey: "person_id"),
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
          anniversary.person_id AS anniversary_person_id,
          anniversary.created_at AS anniversary_created_at, 
          anniversary.updated_at AS anniversary_updated_at, 
          notification.timing AS notification_timing, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN ${DatabaseTable.anniversaries.name} AS anniversary ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.notifications.name} AS notification ON anniversary.id = notification.anniversary_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
      ''',
    );
    final personIds = searched.map((e) => e["person_id"] as String).toSet();
    return personIds.map((personId) {
      final columns =
          searched.where((column) => column["person_id"] == personId);
      final json = columns.first.map(
          (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
      return Person.fromJson({
        ...json,
        "anniversaries":
            convertToJson(columns, "anniversary", additionalKey: "person_id"),
        "contacts":
            convertToJson(columns, "contact", additionalKey: "person_id"),
      });
    });
  }

  @override
  Future<Iterable<Anniversary>> getAllAnniversaries() async {
    final db = await source.database;
    final searched = await db.rawQuery(
      '''
        SELECT 
          anniversary.id AS anniversary_id, 
          anniversary.name AS anniversary_name, 
          anniversary.date AS anniversary_date, 
          anniversary.person_id AS anniversary_person_id,
          anniversary.created_at AS anniversary_created_at, 
          anniversary.updated_at AS anniversary_updated_at, 
          notification.timing AS notification_timing 
        FROM ${DatabaseTable.anniversaries.name} AS anniversary 
          LEFT JOIN ${DatabaseTable.notifications.name} AS notification ON anniversary.id = notification.anniversary_id 
      ''',
    );
    final ids = searched.map((e) => e["anniversary_id"] as String).toSet();
    return ids.map((id) {
      final columns =
          searched.where((element) => element["anniversary_id"] == id);
      final json = columns.first.map((key, value) =>
          MapEntry(key.replaceFirst("anniversary_", ""), value));
      return Anniversary.fromJson({
        ...json,
        "reminds": convertToJson(columns, "notification",
            additionalKey: "anniversary_id"),
      });
    });
  }

  /// 登録済みのリマインドを現在時刻に近いものから順にソートして取得する
  ///
  /// すでにリマインド日時を過ぎたものは来年のリマインド日時に変換して取得する
  @override
  Future<Map<DateTime, Anniversary>> getSortedRemindMap() async {
    final anniversaries = await getAllAnniversaries();
    final now = DateTime.now();
    final map = anniversaries.expand((anniversary) {
      final thisYearDate = anniversary.date.copyWith(year: now.year);
      return anniversary.reminds.map((remind) {
        final duration = Duration(days: remind.timing);
        final remindDate = thisYearDate.subtract(duration);
        return {
          remindDate.copyWith(
            year:
                remindDate.isAfter(now) ? remindDate.year : remindDate.year + 1,
          ): anniversary
        };
      });
    }).fold<Map<DateTime, Anniversary>>(
        {}, ((previousValue, element) => {...previousValue, ...element}));
    final sorted = SplayTreeMap<DateTime, Anniversary>.from(
      map,
      (a, b) => a.compareTo(b),
      (potentialKey) => potentialKey is DateTime && potentialKey.isAfter(now),
    );
    return sorted;
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
      for (final remind in anniversary.reminds) {
        await db.rawInsert(
          '''
            INSERT OR REPLACE INTO ${DatabaseTable.notifications.name} (
              anniversary_id, 
              timing 
            ) VALUES (?, ?)
          ''',
          remind.toJson().values.toList(),
        );
      }
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
