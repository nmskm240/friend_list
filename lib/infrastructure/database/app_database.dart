import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/table.dart' as table;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class AppDatabase<T> {
  Database? _database;

  final String _fileName;
  final table.Table _parentTable;
  final List<table.Table> _childTables;

  @protected
  Future<Database> get database async => _database ??= await init();
  String get fileName => _fileName;
  @protected
  table.Table get parentTable => _parentTable;
  @protected
  List<table.Table> get childTables => _childTables;

  AppDatabase(this._fileName, this._parentTable, this._childTables);

  @protected
  Future<Database> init() async {
    var path = await tryGetPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
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

  @protected
  FutureOr onCreate(Database db, int version);
  Future<void> deleteAt(int id);
  Future<int> update(T element);
  Future<int> insert(T element);
  Future<Iterable<T>> getAll();
  Future<T> getAt(int id);
}
