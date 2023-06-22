import 'package:flutter/material.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/data_source/i_table.dart';
import 'package:friend_list/infrastructure/local_database/i_local_data_source.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseWrapper implements ILocalDataSource {
  Database? _database;

  @override
  Future<Database> get database async => _database ??= await init();
  @protected
  final Iterable<ITable> tables;
  final String fileName;

  DatabaseWrapper({
    required this.tables,
    this.fileName = Strings.dbFileName,
  });

  @protected
  Future<String> getPath();
  @protected
  Future<Database> openDatabaseProcess(String path);

  @protected
  Future<Database> init() async {
    final path = await getPath();
    return await openDatabaseProcess(path);
  }
}
