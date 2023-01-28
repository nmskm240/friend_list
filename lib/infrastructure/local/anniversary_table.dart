import 'dart:async';

import 'package:friend_list/constant/config.dart';
import 'package:friend_list/infrastructure/local/i_table.dart';
import 'package:sqflite/sqflite.dart';

class AnniversaryTable extends ITable {
  const AnniversaryTable() : super(DatabaseConfig.anniversaryTableName);

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) async {
    await database.execute('''
          CREATE TABLE IF NOT EXISTS $name (
            name TEXT,
            date TEXT,
            friend_id INTEGER
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
