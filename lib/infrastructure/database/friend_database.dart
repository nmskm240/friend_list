import 'dart:async';

import 'package:friend_list/infrastructure/database/anniversary_table.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/infrastructure/database/contact_table.dart';
import 'package:friend_list/infrastructure/database/friend_table.dart';
import 'package:friend_list/model/friend.dart';
import 'package:sqflite/sqflite.dart';

class FriendDatabase extends AppDatabase<Friend> {
  FriendDatabase()
      : super(
          "friend.db",
          const FriendTable(),
          [
            const AnniversaryTable(),
            const ContactTable(),
          ],
        );

  @override
  FutureOr onCreate(Database db, int version) async {
    await parentTable.onCreate(db, version);
    for (final table in childTables) {
      await table.onCreate(db, version);
    }
  }

  @override
  Future<void> deleteAt(int id) async {
    final db = await database;
    await db.delete(parentTable.name, where: "id=?", whereArgs: [id]);
    for (final table in childTables) {
      await db.delete(table.name, where: "friend_id=?", whereArgs: [id]);
    }
  }

  @override
  Future<int> update(Friend element) async {
    final id = element.id;
    if (id == null) {
      throw Exception("Cannot be updated");
    }
    final db = await database;
    final friend = element.toJson();
    final others = {};
    for (final e in childTables) {
      final value = friend.remove(e.name.toLowerCase());
      others.addAll({e.name: value});
    }
    await db.update(parentTable.name, friend, where: "id=?", whereArgs: [id]);

    for (final other in others.entries) {
      final registed =
          await db.query(other.key, where: "friend_id=?", whereArgs: [id]);
      if (other.value.isNotEmpty) {
        for (final map in other.value) {
          if (map["id"] == null) {
            map["friend_id"] = id;
            await db.insert(other.key, map);
          } else {
            final isUpdate = registed.any((Map<String, dynamic> r) {
              return r["id"] == map["id"];
            });
            if (isUpdate) {
              await db.update(other.key, map,
                  where: "friend_id=?", whereArgs: [id]);
            } else {
              await db.delete(other.key, where: "friend_id=?", whereArgs: [id]);
            }
          }
        }
      } else {
        for (var i = 0; i < registed.length; i++) {
          await db.delete(other.key, where: "friend_id=?", whereArgs: [id]);
        }
      }
    }
    return id;
  }

  @override
  Future<int> insert(Friend element) async {
    final db = await database;
    final friend = element.toJson();
    final others = {};
    for (final e in childTables) {
      final value = friend.remove(e.name.toLowerCase());
      others.addAll({e.name: value});
    }
    final id = await db.insert(parentTable.name, friend);
    for (final other in others.entries) {
      for (final e in other.value) {
        e["friend_id"] = id;
        await db.insert(other.key, e);
      }
    }
    return id;
  }

  @override
  Future<Iterable<Friend>> getAll() async {
    final db = await database;
    final results = await db.query("friends");
    return await Future.wait(results.map((e) {
      return getAt(e["id"] as int);
    }));
  }

  @override
  Future<Friend> getAt(int id) async {
    final db = await database;
    final results =
        await db.query(parentTable.name, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    final friend = Map<String, dynamic>.from(results.first);
    final Map<String, dynamic> others = {};
    for (final e in childTables) {
      final key = e.name.toLowerCase();
      final value =
          await db.query(e.name, where: "friend_id=?", whereArgs: [id]);
      others.addAll({key: value});
    }
    friend.addAll(others);
    return Friend.fromJson(friend);
  }
}
