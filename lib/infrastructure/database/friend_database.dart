import 'dart:async';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/anniversaryTable_table.dart';
import 'package:friend_list/infrastructure/database/contact_table.dart';
import 'package:friend_list/infrastructure/database/friend_table.dart';
import 'package:friend_list/model/friend.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FriendDatabase {
  final AnniversaryTable _anniversaryTable;
  final ContactTable _contactTable;
  final FriendTable _friendTable;

  FriendDatabase({
    FriendTable? friendTable,
    AnniversaryTable? anniversaryTable,
    ContactTable? contactTable,
  })  : _friendTable = friendTable ?? const FriendTable(),
        _anniversaryTable = anniversaryTable ?? const AnniversaryTable(),
        _contactTable = contactTable ?? const ContactTable();

  Database? _database;

  @protected
  Future<Database> get database async => _database ??= await init();
  String get fileName => "friend.db";

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
  FutureOr onCreate(Database db, int version) async {
    _friendTable.onCreate(db, version);
    _anniversaryTable.onCreate(db, version);
    _contactTable.onCreate(db, version);
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
    final path = join(filePath, 'friends.db');
    return path;
  }

  Future<void> deleteAt(int id) async {
    final db = await database;
    await db.delete(_friendTable.name, where: "id=?", whereArgs: [id]);
    await db
        .delete(_anniversaryTable.name, where: "friend_id=?", whereArgs: [id]);
    await db.delete(_contactTable.name, where: "friend_id=?", whereArgs: [id]);
  }

  Future<int> update(Friend element) async {
    final id = element.id;
    if (id == null) {
      throw Exception("Cannot be updated");
    }
    final db = await database;
    final friend = element.toJson();
    final anniversaries =
        friend.remove("anniversaries") as List<Map<String, dynamic>>;
    final contacts = friend.remove("contacts") as List<Map<String, dynamic>>;
    await db.update(_friendTable.name, friend, where: "id=?", whereArgs: [id]);

    final registedAnniversaries = await db
        .query(_anniversaryTable.name, where: "friend_id=?", whereArgs: [id]);
    if (anniversaries.isNotEmpty) {
      await Future.forEach(anniversaries,
          (Map<String, dynamic> anniversary) async {
        if (anniversary["id"] == null) {
          anniversary["friend_id"] = id;
          await db.insert(_anniversaryTable.name, anniversary);
        } else {
          final isUpdate =
              registedAnniversaries.any((Map<String, dynamic> registed) {
            return registed["id"] == anniversary["id"];
          });
          if (isUpdate) {
            await db.update(_anniversaryTable.name, anniversary,
                where: "friend_id=?", whereArgs: [id]);
          } else {
            await db.delete(_anniversaryTable.name,
                where: "friend_id=?", whereArgs: [id]);
          }
        }
      });
    } else {
      await Future.forEach(registedAnniversaries,
          (Map<String, dynamic> registed) async {
        await db.delete(_anniversaryTable.name,
            where: "friend_id=?", whereArgs: [id]);
      });
    }

    final registedContacts = await db
        .query(_contactTable.name, where: "friend_id=?", whereArgs: [id]);
    if (contacts.isNotEmpty) {
      await Future.forEach(contacts, (Map<String, dynamic> contact) async {
        if (contact["id"] == null) {
          contact["friend_id"] = id;
          await db.insert(_anniversaryTable.name, contact);
        } else {
          final isUpdate =
              registedContacts.any((Map<String, dynamic> registed) {
            return registed["id"] == contact["id"];
          });
          if (isUpdate) {
            await db.update(_contactTable.name, contact,
                where: "friend_id=?", whereArgs: [id]);
          } else {
            await db.delete(_contactTable.name,
                where: "friend_id=?", whereArgs: [id]);
          }
        }
      });
    } else {
      await Future.forEach(registedContacts,
          (Map<String, dynamic> registed) async {
        await db
            .delete(_contactTable.name, where: "friend_id=?", whereArgs: [id]);
      });
    }
    return id;
  }

  Future<int> insert(Friend element) async {
    final db = await database;
    final friend = element.toJson();
    final anniversaries =
        friend.remove("anniversaries") as List<Map<String, dynamic>>;
    final contacts = friend.remove("contacts") as List<Map<String, dynamic>>;
    final id = await db.insert(_friendTable.name, friend);
    await Future.forEach(anniversaries, (Map<String, dynamic> e) async {
      e["friend_id"] = id;
      await db.insert(_anniversaryTable.name, e);
    });
    await Future.forEach(contacts, (Map<String, dynamic> e) async {
      e["friend_id"] = id;
      await db.insert(_contactTable.name, e);
    });
    return id;
  }

  Future<Iterable<Friend>> getAll() async {
    var db = await database;
    var results = await db.query("friends");
    return await Future.wait(results.map((e) {
      return getAt(e["id"] as int);
    }));
  }

  Future<Friend> getAt(int id) async {
    var db = await database;
    var results =
        await db.query(_friendTable.name, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    final friend = Map<String, dynamic>.from(results.first);
    final anniversaries = await db
        .query(_anniversaryTable.name, where: "friend_id=?", whereArgs: [id]);
    final contacts = await db
        .query(_contactTable.name, where: "friend_id=?", whereArgs: [id]);
    friend.addAll({
      "anniversaries": anniversaries,
      "contacts": contacts,
    });
    return Friend.fromJson(friend);
  }
}
