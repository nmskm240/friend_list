import 'package:flutter/widgets.dart';
import 'package:friend_list/common/constant/strings.dart';
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
  Iterable<Map<String, dynamic>?> convertToAnniversaryJson(
    Iterable<Map<String, Object?>> columns,
  ) {
    final List<Map<String, dynamic>?> unique = [];
    columns
        .map((column) {
          final entries = column.entries.where((element) =>
              element.value != null && element.key.contains("anniversary"));
          final map = Map.fromEntries(entries);
          if (map.isNotEmpty && column.containsKey("person_id")) {
            map.addAll({
              "person_id": column["person_id"],
              "notification_ids": column.entries
                  .where((element) =>
                      element.value != null &&
                      element.key.contains("notification"))
                  .map((e) => int.tryParse(e.value.toString()))
                  .toList(),
            });
            final json = map.map<String, dynamic>((key, value) =>
                MapEntry(key.replaceFirst("anniversary_", ""), value));
            return json;
          }
          return null;
        })
        .where((json) => json != null)
        .forEach((json) {
          if (unique.every((element) => element!["id"] != json!["id"])) {
            unique.add(json);
          }
        });
    return unique;
  }

  @protected
  Iterable<Map<String, dynamic>?> convertToContactJson(
    Iterable<Map<String, Object?>> columns,
  ) {
    final List<Map<String, dynamic>?> unique = [];
    columns
        .map((column) {
          final entries = column.entries.where((element) =>
              element.value != null && element.key.contains("contact"));
          final map = Map.fromEntries(entries);
          if (map.isNotEmpty && column.containsKey("person_id")) {
            map.addAll({"person_id": column["person_id"]});
            final json = map.map<String, dynamic>((key, value) =>
                MapEntry(key.replaceFirst("contact_", ""), value));
            return json;
          }
          return null;
        })
        .where((json) => json != null)
        .forEach((json) {
          if (unique.every((e) => e!["id"] != json!["id"])) {
            unique.add(json);
          }
        });
    return unique;
  }

  @protected
  Future<void> createTempolaryAnniversaryAndNotificationTable(
      {String tableName = "anniversaryAndNotifications"}) async {
    final db = await source.database;
    await db.execute(
      '''
        CREATE TEMPORARY TABLE $tableName 
        AS 
        SELECT 
          anniversary.id AS anniversary_id, 
          anniversary.name AS anniversary_name, 
          anniversary.date AS anniversary_date, 
          anniversary.person_id AS anniversary_person_id,
          anniversary.created_at AS anniversary_created_at, 
          anniversary.updated_at AS anniversary_updated_at, 
          notification.id AS notification_id 
        FROM ${DatabaseTable.anniversaries.name} AS anniversary 
          LEFT JOIN ${DatabaseTable.notifications.name} AS notification ON anniversary.id = notification.anniversary_id 
      ''',
    );
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
    await createTempolaryAnniversaryAndNotificationTable();
    final searched = await db.rawQuery(
      '''
        SELECT 
          person.id AS person_id, 
          person.name AS person_name, 
          person.nickname AS person_nickname, 
          person.icon AS person_icon, 
          person.created_at AS person_created_at, 
          person.updated_at AS person_updated_at, 
          anniversary_id, 
          anniversary_name, 
          anniversary_date, 
          anniversary_created_at, 
          anniversary_updated_at, 
          notification_id, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN anniversaryAndNotifications ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.id = ?
      ''',
      [id],
    );
    await db.execute(
      '''
        DROP TABLE anniversaryAndNotifications;
      ''',
    );
    if (searched.isEmpty) {
      throw UnregisteredPersonException(id);
    }
    final json = searched.first.map<String, dynamic>(
        (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
    return Person.fromJson({
      ...json,
      "anniversaries": convertToAnniversaryJson(searched),
      "contacts": convertToContactJson(searched),
    });
  }

  @override
  Future<Iterable<Person>> findByNameOrNickname(String value) async {
    final db = await source.database;
    await createTempolaryAnniversaryAndNotificationTable();
    final searched = await db.rawQuery(
      '''
        SELECT 
          person.id AS person_id, 
          person.name AS person_name, 
          person.nickname AS person_nickname, 
          person.icon AS person_icon, 
          person.created_at AS person_created_at, 
          person.updated_at AS person_updated_at, 
          anniversary_id,
          anniversary_name,
          anniversary_date,
          anniversary_created_at, 
          anniversary_updated_at, 
          notification_id, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN anniversaryAndNotifications ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
        WHERE person.name LIKE '%$value%' OR person.nickname LIKE '%$value%'
      ''',
    );
    await db.execute(
      '''
        DROP TABLE anniversaryAndNotifications;
      ''',
    );
    final personIds = searched.map((e) => e["person_id"] as String).toSet();
    debugPrint(personIds.toString());
    return personIds.map((personId) {
      final columns =
          searched.where((column) => column["person_id"] == personId);
      final json = columns.first.map<String, dynamic>(
          (key, value) => MapEntry(key.replaceFirst("person_", ""), value));
      return Person.fromJson({
        ...json,
        "anniversaries": convertToAnniversaryJson(columns),
        "contacts": convertToContactJson(columns),
      });
    });
  }

  @override
  Future<Iterable<Person>> getAll() async {
    final db = await source.database;
    await createTempolaryAnniversaryAndNotificationTable();
    final searched = await db.rawQuery(
      '''
        SELECT 
          person.id AS person_id, 
          person.name AS person_name, 
          person.nickname AS person_nickname, 
          person.icon AS person_icon, 
          person.created_at AS person_created_at, 
          person.updated_at AS person_updated_at, 
          anniversary_id,
          anniversary_name,
          anniversary_date,
          anniversary_created_at,
          anniversary_updated_at,
          notification_id, 
          contact.id AS contact_id,
          contact.name AS contact_name,
          contact.method AS contact_method,
          contact.value AS contact_value,
          contact.created_at AS contact_created_at,
          contact.updated_at AS contact_updated_at 
        FROM ${DatabaseTable.persons.name} AS person 
          LEFT JOIN temp AS anniversaryAndNotifications ON person.id = anniversary_person_id 
          LEFT JOIN ${DatabaseTable.contacts.name} AS contact ON person.id = contact.person_id 
      ''',
    );
    await db.execute(
      '''
        DROP TABLE anniversaryAndNotifications;
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
        "anniversaries": convertToAnniversaryJson(columns),
        "contacts": convertToContactJson(columns),
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
          notification.id AS notification_id,
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
        Strings.jsonKeyNotificationId: columns
            .map((e) => int.tryParse(e["notification_id"] as String))
            .toList(),
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
      for (final notification in anniversary.notificationIds) {
        await db.rawInsert(
          '''
            INSERT OR REPLACE INTO ${DatabaseTable.notifications.name} (
              id,
              anniversary_id
            ) VALUES (?, ?)
          ''',
          [notification, anniversary.id],
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
