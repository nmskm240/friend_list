import 'package:friend_list/constant/config.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository.dart';

class FriendRepositoryByLocalDatbase implements FriendRepository {
  @override
  Future<void> deleteByID(int id) async {
    final db = await AppDatabase.instance.database;
    await db.delete(Config.friendTableName, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<Friend> findByID(int id) async {
    final db = await AppDatabase.instance.database;
    final results =
        await db.query(Config.friendTableName, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Friend.fromJson(results.first);
  }

  @override
  Future<Iterable<Friend>> getAll() async {
    final db = await AppDatabase.instance.database;
    final results = await db.query(Config.friendTableName);
    return results.map((e) {
      return Friend.fromJson(e);
    });
  }

  @override
  Future<Friend> save(Friend element) async {
    late final int id;
    final db = await AppDatabase.instance.database;
    if (element.id == null) {
      id = await db.insert(Config.friendTableName, element.toJson());
    } else {
      id = element.id!;
      await db.update(Config.friendTableName, element.toJson(),
          where: "id=?", whereArgs: [id]);
    }
    return findByID(id);
  }
}
