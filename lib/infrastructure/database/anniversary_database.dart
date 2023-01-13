import 'dart:async';

import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/infrastructure/database/anniversary_table.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';

class AnniversaryDatabase extends AppDatabase<Anniversary> {
  AnniversaryDatabase()
      : super(
          fileName: "anniversary.db",
          table: const AnniversaryTable(),
        );

  @override
  Future<void> deleteByID(int id) async {
    final db = await database;
    await db.delete(table.name, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<int> update(Anniversary element) async {
    if (element.id == null) {
      throw Exception("Unregistered element");
    } else if (element.friendID == null) {
      throw Exception("No friendID associated");
    }
    final db = await database;
    final id = element.id!;
    await db
        .update(table.name, element.toJson(), where: "id=?", whereArgs: [id]);
    return id;
  }

  @override
  Future<int> insert(Anniversary element) async {
    if (element.friendID == null) {
      throw Exception("No friendID associated");
    }
    final db = await database;
    final friend = element.toJson();
    return await db.insert(table.name, friend);
  }

  @override
  Future<Iterable<Anniversary>> getAll() async {
    final db = await database;
    final results = await db.query(table.name);
    return results.map((e) {
      return Anniversary.fromJson(e);
    });
  }

  @override
  Future<Anniversary> getByID(int id) async {
    final db = await database;
    final results = await db.query(table.name, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Anniversary.fromJson(results.first);
  }
}
