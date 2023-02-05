import 'package:friend_list/data_source/database_table.dart';
import 'package:friend_list/domain/tag/i_tag_repository.dart';
import 'package:friend_list/domain/tag/tag.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';

class TagRepository implements ITagRepository {
  final ILocalDataSource _source;

  const TagRepository(this._source);

  @override
  Future<void> deleteAll() async {
    final db = await _source.database;
    await db.delete(DatabaseTable.tags.name);
  }

  @override
  Future<void> deleteByID(String id) async {
    final db = await _source.database;
    await db.delete(
      DatabaseTable.tags.name,
      where: "tag_id = ?",
      whereArgs: [id],
    );
  }

  @override
  Future<Tag?> findByID(String id) async {
    final db = await _source.database;
    final searched = await db.query(
      DatabaseTable.tags.name,
      where: "tag_id = ?",
      whereArgs: [id],
      limit: 1,
    );
    return searched.isEmpty ? null : Tag.fromJson(searched.first);
  }

  @override
  Future<Tag?> findByName(String name) async {
    final db = await _source.database;
    final searched = await db.query(
      DatabaseTable.tags.name,
      where: "name = ?",
      whereArgs: [name],
      limit: 1,
    );
    return searched.isEmpty ? null : Tag.fromJson(searched.first);
  }

  @override
  Future<Iterable<Tag>> getAll() async {
    final db = await _source.database;
    final results = await db.query(DatabaseTable.tags.name);
    return results.map((e) => Tag.fromJson(e));
  }

  @override
  Future<Tag> save(Tag tag) async {
    final db = await _source.database;
    final searched = await findByID(tag.id);
    if (searched == null) {
      db.insert(DatabaseTable.tags.name, tag.toJson());
    } else {
      db.update(
        DatabaseTable.tags.name,
        tag.toJson(),
        where: "tag_id = ?",
        whereArgs: [tag.id],
      );
    }
    return tag;
  }
}
