import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/anniversary_table.dart';
import 'package:friend_list/infrastructure/database/contact_table.dart';
import 'package:friend_list/infrastructure/database/friend_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Database? _database;

  static final AppDatabase instance = AppDatabase._();
  final String fileName = "app.db";
  final tables = const [
    FriendTable(),
    AnniversaryTable(),
    ContactTable(),
  ];

  Future<Database> get database async => _database ??= await _init();

  AppDatabase._();

  Future<Database> _init() async {
    var path = await _tryGetPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<String> _tryGetPath() async {
    late final String path;
    if (Platform.isAndroid) {
      path = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final directory = await getLibraryDirectory();
      path = directory.path;
    } else {
      throw Exception('Unable to determine platform.');
    }
    return join(path, fileName);
  }

  @protected
  void _onCreate(Database db, int version) {
    for (final table in tables) {
      table.onCreate(db, version);
    }
  }
}
