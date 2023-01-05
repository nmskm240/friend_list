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
            birthday TEXT
          )
          ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Anniversaries (
            id INTEGER AUTOINCREMENT,
            name TEXT,
            date TEXT,
            friend_id INTEGER,
            PRIMARY KEY (id, friend_id),
            FOREIGN KEY (friend_id) REFERENCES Friends (id)
          )
          ''');
        await db.execute('''
          CREATE TABLE IF NOT EXISTS Contacts (
            id INTEGER AUTOINCREMENT,
            method TEXT,
            value TEXT,
            friend_id INTEGER,
            PRIMARY KEY (id, friend_id),
            FOREIGN KEY (friend_id) REFERENCES Friends (id)
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

  Future<void> insert(Friend element) async {
    final db = await database;
    final friend = element.toJson();
    final anniversaries = friend.remove("anniversaries") as List<Map<String, dynamic>>;
    final contacts = friend.remove("contacts") as List<Map<String, dynamic>>;
    final id = await db.insert("Friends", friend);
    await Future.forEach(anniversaries, (Map<String, dynamic> e) async {
      e["friend_id"] = id;
      await db.insert("Anniversaries", e);
    });
    await Future.forEach(contacts, (Map<String, dynamic> e) async {
      e["friend_id"] = id;
      await db.insert("Contacts", e);
    });
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
