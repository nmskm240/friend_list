import 'package:friend_list/domain/tag/tag.dart';

abstract class ITagRepository {
  Future<void> deleteByID(int id);
  Future<Tag?> findByID(int id);
  Future<Tag?> findByName(String name);
  Future<Iterable<Tag>> getAll();
  Future<Tag> save(Tag tag);
}
