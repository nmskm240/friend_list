import 'package:friend_list/constant/config.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/infrastructure/local/app_database.dart';
import 'package:friend_list/infrastructure/local/i_database_provider.dart';
import 'package:friend_list/repository/friend_repository.dart';
import 'package:sqflite/sqflite.dart';

class FriendRepositoryByLocalDatbase implements FriendRepository {
  late final IDatabaseProvider _local;

  FriendRepositoryByLocalDatbase({IDatabaseProvider? local}) {
    _local = local ?? AppDatabase();
  }

  @override
  Future<void> deleteByID(int id) async {
    final db = await _local.database;
    await db.delete(DatabaseConfig.friendTableName, where: "id=?", whereArgs: [id]);
    await _deleteAllChildElements(id);
  }

  @override
  Future<Friend> findByID(int id) async {
    final db = await _local.database;
    final results =
        await db.query(DatabaseConfig.friendTableName, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return _convertJsonToFriend(db, results.first);
  }

  @override
  Future<Iterable<Friend>> getAll() async {
    final db = await _local.database;
    final results = await db.query(DatabaseConfig.friendTableName);
    return Future.wait(results.map((e) => _convertJsonToFriend(db, e)));
  }

  @override
  Future<Friend> save(Friend element) async {
    late final int id;
    if (element.id == null) {
      id = await _insert(element);
    } else {
      id = await _update(element);
    }
    return findByID(id);
  }

  Future<void> _deleteAllChildElements(int friendID) async {
    final db = await _local.database;
    for (final table in [
      DatabaseConfig.anniversaryTableName,
      DatabaseConfig.contactTableName
    ]) {
      await db.delete(table, where: "friend_id=?", whereArgs: [friendID]);
    }
  }

  Future<int> _update(Friend element) async {
    final db = await _local.database;
    final id = element.id!;
    await db.update(DatabaseConfig.friendTableName, element.toJson(),
        where: "id=?", whereArgs: [id]);
    await _deleteAllChildElements(id);
    return id;
  }

  Future<int> _insert(Friend element) async {
    final db = await _local.database;
    final id = await db.insert(DatabaseConfig.friendTableName, element.toJson());
    await _insertAllChildElements(element.copyWith(id: id));
    return id;
  }

  Future<void> _insertAllChildElements(Friend element) async {
    final anniversaries =
        element.anniversaries.map((e) => e.copyWith(friendID: element.id));
    await _insertAll(DatabaseConfig.anniversaryTableName, anniversaries);
    final contacts =
        element.contacts.map((e) => e.copyWith(friendID: element.id));
    await _insertAll(DatabaseConfig.contactTableName, contacts);
  }

  Future<void> _insertAll(String table, Iterable elements) async {
    final db = await _local.database;
    for (final element in elements) {
      await db.insert(table, element.toJson());
    }
  }

  Future<Friend> _convertJsonToFriend(
      Database db, Map<String, dynamic> json) async {
    final friend = Friend.fromJson(json);
    final anniversaries = await db.query(DatabaseConfig.anniversaryTableName,
        where: "friend_id=?", whereArgs: [friend.id]);
    final contacts = await db.query(DatabaseConfig.contactTableName,
        where: "friend_id=?", whereArgs: [friend.id]);
    return friend.copyWith(
      anniversaries: anniversaries.map((e) => Anniversary.fromJson(e)).toList(),
      contacts: contacts.map((e) => Contact.fromJson(e)).toList(),
    );
  }
}
