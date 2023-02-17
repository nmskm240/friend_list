import 'dart:async';

import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:sqflite/sqlite_api.dart';

class RegisteredTagTable implements ITable {
  @override
  String get name => DatabaseTable.registredTags.name;

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) {
    database.execute('''
      CREATE TABLE $name (
        person_id TEXT,
        tag_id TEXT,
        PRIMARY KEY (person_id, tag_id),
        FOREIGN KEY (person_id) REFERENCES ${DatabaseTable.persons.name}(id) ON DELETE CASCADE,
        FOREIGN KEY (tag_id) REFERENCES ${DatabaseTable.tags.name}(tag_id) ON DELETE CASCADE
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
