import 'dart:async';

import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:sqflite/sqlite_api.dart';

class PersonTable implements ITable {
  @override
  String get name => DatabaseTable.persons.name;

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) {
    database.execute('''
      CREATE TABLE $name (
        person_id TEXT,
        name TEXT,
        nickname TEXT,
        icon TEXT,
        created_at TEXT,
        updated_at TEXT,
        PRIMARY KEY (person_id)
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
