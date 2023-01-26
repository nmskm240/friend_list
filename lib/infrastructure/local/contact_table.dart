import 'dart:async';

import 'package:friend_list/constant/config.dart';
import 'package:friend_list/infrastructure/local/i_table.dart';
import 'package:sqflite/sqflite.dart';

class ContactTable extends ITable {
  const ContactTable() : super(Config.contactTableName);

  @override
  FutureOr<void>? onConfigure(Database database) {}

  @override
  FutureOr<void>? onCreate(Database database, int version) async {
    await database.execute('''
          CREATE TABLE IF NOT EXISTS $name (
            method TEXT,
            value TEXT,
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
