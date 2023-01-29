import 'package:friend_list/constant/config.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/infrastructure/local/app_database.dart';
import 'package:friend_list/infrastructure/local/i_database_provider.dart';
import 'package:friend_list/repository/person_repository.dart';
import 'package:sqflite/sqflite.dart';

class PersonRepositoryByLocalDatbase implements PersonRepository {
  late final IDatabaseProvider _local;

  PersonRepositoryByLocalDatbase({IDatabaseProvider? local}) {
    _local = local ?? AppDatabase();
  }

  @override
  Future<void> deleteByID(int id) async {
    final db = await _local.database;
    await db.delete(DatabaseConfig.personTableName, where: "id=?", whereArgs: [id]);
    await _deleteAllChildElements(id);
  }

  @override
  Future<Person> findByID(int id) async {
    final db = await _local.database;
    final results =
        await db.query(DatabaseConfig.personTableName, where: "id=?", whereArgs: [id]);
    if (results.isEmpty) {
      throw Exception("The element with the specified ID does not exist.");
    }
    return _convertJsonToEntity(db, results.first);
  }

  @override
  Future<Iterable<Person>> getAll() async {
    final db = await _local.database;
    final results = await db.query(DatabaseConfig.personTableName);
    return Future.wait(results.map((e) => _convertJsonToEntity(db, e)));
  }

  @override
  Future<Person> save(Person element) async {
    late final int id;
    if (element.id == null) {
      id = await _insert(element);
    } else {
      id = await _update(element);
    }
    return findByID(id);
  }

  Future<void> _deleteAllChildElements(int personID) async {
    final db = await _local.database;
    for (final table in [
      DatabaseConfig.anniversaryTableName,
      DatabaseConfig.contactTableName
    ]) {
      await db.delete(table, where: "person_id=?", whereArgs: [personID]);
    }
  }

  Future<int> _update(Person element) async {
    final db = await _local.database;
    final id = element.id!;
    await db.update(DatabaseConfig.personTableName, element.toJson(),
        where: "id=?", whereArgs: [id]);
    await _deleteAllChildElements(id);
    return id;
  }

  Future<int> _insert(Person element) async {
    final db = await _local.database;
    final id = await db.insert(DatabaseConfig.personTableName, element.toJson());
    await _insertAllChildElements(element.copyWith(id: id));
    return id;
  }

  Future<void> _insertAllChildElements(Person element) async {
    final anniversaries =
        element.anniversaries.map((e) => e.copyWith(personID: element.id));
    await _insertAll(DatabaseConfig.anniversaryTableName, anniversaries);
    final contacts =
        element.contacts.map((e) => e.copyWith(personID: element.id));
    await _insertAll(DatabaseConfig.contactTableName, contacts);
  }

  Future<void> _insertAll(String table, Iterable elements) async {
    final db = await _local.database;
    for (final element in elements) {
      await db.insert(table, element.toJson());
    }
  }

  Future<Person> _convertJsonToEntity(
      Database db, Map<String, dynamic> json) async {
    final person = Person.fromJson(json);
    final anniversaries = await db.query(DatabaseConfig.anniversaryTableName,
        where: "person_id=?", whereArgs: [person.id]);
    final contacts = await db.query(DatabaseConfig.contactTableName,
        where: "person_id=?", whereArgs: [person.id]);
    return person.copyWith(
      anniversaries: anniversaries.map((e) => Anniversary.fromJson(e)).toList(),
      contacts: contacts.map((e) => Contact.fromJson(e)).toList(),
    );
  }
}
