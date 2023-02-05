import 'dart:async';

import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:sqflite/sqflite.dart';

class TagTable implements ITable {
  @override
  String get name => DatabaseTable.tags.name;

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) {
    database.execute('''
      CREATE TABLE $name (
        tag_id TEXT,
        name TEXT,
        PRIMARY KEY (tag_id)
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
