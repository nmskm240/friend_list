import 'package:friend_list/constant/config.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/repository/anniversary_repository.dart';

class AnniversaryRepositoryByLocalDatabase implements AnniversaryRepository {
  @override
  Future<void> deleteByID(int id) async {
    final db = await AppDatabase.instance.database;
    await db
        .delete(Config.anniversaryTableName, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<Anniversary> findByID(int id) async {
    final db = await AppDatabase.instance.database;
    final results = await db
        .query(Config.anniversaryTableName, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Anniversary.fromJson(results.first);
  }

  @override
  Future<Iterable<Anniversary>> getAllByFriendID(int friendID) async {
    final db = await AppDatabase.instance.database;
    final jsons = await db.query(Config.anniversaryTableName,
        where: "friend_id=?", whereArgs: [friendID]);
    return jsons.map((json) {
      return Anniversary.fromJson(json);
    });
  }

  @override
  Future<Anniversary> save(Anniversary element) async {
    late final int id;
    final db = await AppDatabase.instance.database;
    if (element.id == null) {
      id = await db.insert(Config.anniversaryTableName, element.toJson());
    } else {
      id = element.id!;
      await db.update(Config.anniversaryTableName, element.toJson(),
          where: "id=?", whereArgs: [id]);
    }
    return findByID(id);
  }
}
