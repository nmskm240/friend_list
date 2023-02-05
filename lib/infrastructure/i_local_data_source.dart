import 'package:sqflite/sqflite.dart';

abstract class ILocalDataSource {
  final Future<Database> database;

  const ILocalDataSource(this.database);
}