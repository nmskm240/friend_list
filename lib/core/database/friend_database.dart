import 'dart:io';

import 'package:friend_list/model/friend.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FriendDatabase {
  FriendDatabase._();
  static final FriendDatabase instance = FriendDatabase._();

  static Database? _database;

  Future<Database> get database async => _database ??= await init();

  Future<Database> init() async {
    var path = await tryGetPath();
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Friends (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            nickname TEXT,
            icon TEXT,
            birthday TEXT,
            anniversary TEXT,
            contact TEXT
          )
          ''');
      },
    );
  }

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
    final path = join(filePath, 'friends.db');
    return path;
  }

  Future<Iterable<Friend>> getAll() async {
    var db = await database;
    var results = await db.query("friends");
    return results.map(
      (e) {
        int? id = e["id"] as int?;
        String name = e["name"] as String;
        String? nickname = e["nickname"] as String?;
        String? icon = e["icon"] as String?;
        return Friend(
          id: id,
          name: name,
          nickname: nickname,
          icon: icon,
        );
      },
    );
  }

  Future<Friend> getAt(int id) async {
    var db = await database;
    var results = await db.query("friends", where: "id=?", whereArgs: [id]);
    if(results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Friend.fromJson(results.first);
  }
}
