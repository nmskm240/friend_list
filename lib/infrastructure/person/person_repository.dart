import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class PersonRepository implements IPersonRepository {
  final ILocalDataSource _source;

  const PersonRepository(this._source);

  @override
  Future<void> attachTags(String id, List<String> tagIds) async {
    final db = await _source.database;
    for (final tagId in tagIds) {
      await db.rawInsert('''
        INSERT INTO ${DatabaseTable.registredTags.name} (person_id, tag_id) VALUES (?, ?)
      ''', [
        id,
        tagId,
      ]);
    }
  }

  @override
  Future<void> deleteAll() async {
    final db = await _source.database;
    await db.delete(DatabaseTable.persons.name);
  }

  @override
  Future<void> deleteByID(String id) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.persons.name,
      where: "person_id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<Person?> findByID(String id) async {
    final db = await _source.database;
    final searched = await db.query(
      DatabaseTable.persons.name,
      where: "person_id = ?",
      whereArgs: [id],
      limit: 1,
    );
    return searched.isEmpty ? null : Person.fromJson(searched.first);
  }

  @override
  Future<Iterable<Person>> findByNameOrNickname(String value,
      {bool isParticalMatch = false}) async {
    final db = await _source.database;
    late Iterable<Map<String, dynamic>> searched;
    if (isParticalMatch) {
      searched = await db.rawQuery('''
        SELECT * FROM ${DatabaseTable.persons.name} 
        WHERE name LIKE '%$value%' OR nickname LIKE '%$value%'
      ''');
    } else {
      searched = await db.rawQuery('''
        SELECT * FROM ${DatabaseTable.persons.name} 
        WHERE name = ? OR nickname = ?
      ''', [value, value]);
    }
    return searched.map((e) => Person.fromJson(e));
  }

  @override
  Future<Iterable<Person>> getAll() async {
    final db = await _source.database;
    final results = await db.query(DatabaseTable.persons.name);
    return results.map((e) => Person.fromJson(e));
  }

  @override
  Future<Iterable<String>> getAttachedTagIDs(String id) async {
    final db = await _source.database;
    final searched = await db.query(
      DatabaseTable.registredTags.name,
      where: "person_id = ?",
      whereArgs: [id],
    );
    return searched.map((e) => e["tag_id"].toString());
  }

  @override
  Future<void> removeTags(String id, List<String> tagIds) async {
    final db = await _source.database;
    for (final tagId in tagIds) {
      await db.rawDelete('''
        DELETE FROM ${DatabaseTable.registredTags.name} WHERE person_id = ? AND tag_id = ?
      ''', [id, tagId]);
    }
  }

  @override
  Future<Person> save(Person person) async {
    final db = await _source.database;
    final searched = await findByID(person.id);
    if (searched == null) {
      await db.insert(
        DatabaseTable.persons.name,
        person.toJson(),
      );
    } else {
      await db.update(
        DatabaseTable.persons.name,
        person.toJson(),
        where: "person_id = ?",
        whereArgs: [person.id],
      );
    }
    return person;
  }
}
