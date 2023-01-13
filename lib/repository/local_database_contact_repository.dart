import 'package:friend_list/constant/config.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/repository/contact_repository.dart';

class LocalDatabaseContactRepository implements ContactRepository {
  @override
  Future<void> deleteByID(int id) async {
    final db = await AppDatabase.instance.database;
    await db.delete(Config.contactTableName, where: "id=?", whereArgs: [id]);
  }

  @override
  Future<Iterable<Contact>> getAllByFriendID(int friendID) async {
    final db = await AppDatabase.instance.database;
    final jsons = await db.query(Config.contactTableName,
        where: "friend_id=?", whereArgs: [friendID]);
    return jsons.map((json) {
      return Contact.fromJson(json);
    });
  }

  @override
  Future<Contact> save(Contact element) async {
    late final int id;
    final db = await AppDatabase.instance.database;
    if (element.id == null) {
      id = await db.insert(Config.contactTableName, element.toJson());
    } else {
      id = element.id!;
      await db.update(Config.contactTableName, element.toJson(),
          where: "id=?", whereArgs: [id]);
    }
    return findByID(id);
  }

  @override
  Future<Contact> findByID(int id) async {
    final db = await AppDatabase.instance.database;
    final results =
        await db.query(Config.contactTableName, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return Contact.fromJson(results.first);
  }
}
