import 'dart:async';

import 'package:friend_list/constant/config.dart';
import 'package:friend_list/infrastructure/local/i_table.dart';
import 'package:sqflite/sqflite.dart';

class FriendTable extends ITable {
  const FriendTable() : super(DatabaseConfig.friendTableName);

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) async {
    await database.execute('''
          CREATE TABLE IF NOT EXISTS $name (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            nickname TEXT,
            icon TEXT,
            created_at TEXT,
            updated_at TEXT
          )
          ''');
  }

  @override
  FutureOr<void>? onDowngrade(
      Database database, int oldVersion, int currentVersion) {}

  @override
  FutureOr<void>? onOpen(Database database) {}

  @override
  FutureOr<void>? onUpgrade(
      Database database, int oldVersion, int currentVersion) {}
}
