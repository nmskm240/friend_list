import 'dart:async';
import 'dart:io';

import 'package:friend_list/infrastructure/local/anniversary_table.dart';
import 'package:friend_list/infrastructure/local/contact_table.dart';
import 'package:friend_list/infrastructure/local/friend_table.dart';
import 'package:friend_list/infrastructure/local/i_database_provider.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase implements IDatabaseProvider {
  Database? _database;

  final String fileName = "app.db";
  final tables = const [
    FriendTable(),
    AnniversaryTable(),
    ContactTable(),
  ];

  @override
  Future<Database> get database async => _database ??= await init();

  @override
  Future<Database> init() async {
    var path = await _tryGetPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
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

  @override
  void onCreate(Database db, int version) {
    for (final table in tables) {
      table.onCreate(db, version);
    }
  }
}
