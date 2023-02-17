import 'dart:async';

import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:sqflite/sqflite.dart';

class ContactTable implements ITable {
  @override
  String get name => DatabaseTable.contacts.name;

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) {
    database.execute('''
      CREATE TABLE $name (
        id TEXT,
        person_id TEXT,
        name TEXT,  
        method TEXT,
        value TEXT,
        created_at TEXT,
        updated_at TEXT,
        PRIMARY KEY (id),
        FOREIGN KEY (person_id) REFERENCES ${DatabaseTable.persons.name} (id) ON DELETE CASCADE
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
