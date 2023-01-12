import 'dart:async';

import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/infrastructure/database/friend_table.dart';
import 'package:friend_list/entity/friend.dart';

class FriendDatabase extends AppDatabase<Friend> {
  FriendDatabase() : super(table: const FriendTable());

  @override
  Future<void> deleteByID(int id) async {
    final db = await database;
    await db.delete(table.name, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<int> update(Friend element) async {
    if (element.id == null) {
      throw Exception("Unregistered element");
    }
    final db = await database;
    final id = element.id!;
    await db
        .update(table.name, element.toJson(), where: "id=?", whereArgs: [id]);
    return id;
  }

  @override
  Future<int> insert(Friend element) async {
    final db = await database;
    final friend = element.toJson();
    return await db.insert(table.name, friend);
  }

  @override
  Future<Iterable<Friend>> getAll() async {
    final db = await database;
    final results = await db.query(table.name);
    return results.map((e) {
      return Friend.fromJson(e);
    });
  }

  @override
  Future<Friend> getByID(int id) async {
    final db = await database;
    final results = await db.query(table.name, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Friend.fromJson(results.first);
  }
}
