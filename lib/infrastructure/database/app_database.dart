import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/table.dart' as t;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppDatabase<T> {
  Database? _database;

  final String fileName;
  final t.Table table;

  @protected
  Future<Database> get database async => _database ??= await init();

  AppDatabase({
    this.fileName = "app.db",
    required this.table,
  });

  @protected
  Future<Database> init() async {
    var path = await tryGetPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) => table.onCreate(db, version),
    );
  }

  @protected
  Future<String> tryGetPath() async {
    var filePath = '';
    if (Platform.isAndroid) {
      filePath = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final directory = await getLibraryDirectory();
      filePath = directory.path;
    } else {
      throw Exception('Unable to determine platform.');
    }
    final path = join(filePath, fileName);
    return path;
  }

  Future<void> deleteByID(int id);
  Future<int> update(T element);
  Future<int> insert(T element);
  Future<Iterable<T>> getAll();
  Future<T> getByID(int id);
}
