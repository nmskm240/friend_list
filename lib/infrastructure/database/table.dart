import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class Table {
  final String name;

  const Table(this.name);

  FutureOr<void>? onConfigure(Database database);
  FutureOr<void>? onCreate(Database database, int version);
  FutureOr<void>? onUpgrade(Database database, int oldVersion, int currentVersion);
  FutureOr<void>? onDowngrade(Database database, int oldVersion, int currentVersion);
  FutureOr<void>? onOpen(Database database);
}