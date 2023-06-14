import 'dart:async';

import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:sqflite/sqflite.dart';

class NotificationTable implements ITable {
  @override
  String get name => DatabaseTable.notifications.name;

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) {
    database.execute('''
      CREATE TABLE $name (
        id INTEGER,
        anniversary_id TEXT, 
        interval_days INTEGER, 
        PRIMARY KEY (id),
        FOREIGN KEY (anniversary_id) REFERENCES ${DatabaseTable.anniversaries.name} (id) ON DELETE CASCADE
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
