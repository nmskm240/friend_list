import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_repository.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class AnniversaryRepository implements IAnniversaryRepository {
  final ILocalDataSource _source;

  const AnniversaryRepository(this._source);

  @override
  Future<void> deleteAll() async {
    final db = await _source.database;
    await db.delete(DatabaseTable.anniversaries.name);
  }

  @override
  Future<void> deleteAllByPersonID(String personId) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.anniversaries.name,
      where: "person_id = ?",
      whereArgs: [personId],
    );
  }

  @override
  Future<void> deleteByID(String id) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.anniversaries.name,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<Anniversary?> findByID(String id) async {
    final db = await _source.database;
    final results = await db.query(
      DatabaseTable.anniversaries.name,
      where: "anniversary_id = ?",
      whereArgs: [id],
      limit: 1,
    );
    return results.isEmpty ? null : Anniversary.fromJson(results.first);
  }

  @override
  Future<Iterable<Anniversary>> findByPersonID(String personId) async {
    final db = await _source.database;
    final results = await db.query(
      DatabaseTable.anniversaries.name,
      where: "person_id = ?",
      whereArgs: [personId],
    );
    return results.map((e) => Anniversary.fromJson(e));
  }

  @override
  Future<Iterable<Anniversary>> getAll() async {
    final db = await _source.database;
    final results = await db.query(DatabaseTable.anniversaries.name);
    return results.map((e) => Anniversary.fromJson(e));
  }

  @override
  Future<Anniversary> save(Anniversary anniversary) async {
    final db = await _source.database;
    final searched = await findByID(anniversary.id);
    if (searched == null) {
      await db.insert(DatabaseTable.anniversaries.name, anniversary.toJson());
    } else {
      await db.update(
        DatabaseTable.anniversaries.name,
        anniversary.toJson(),
        where: "anniversary_id = ?",
        whereArgs: [anniversary.id],
      );
    }
    return anniversary;
  }
}
