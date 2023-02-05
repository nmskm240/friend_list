import 'package:friend_list/domain/tag/tag.dart';

abstract class ITagRepository {
  Future<void> deleteAll();
  Future<void> deleteByID(String id);
  Future<Tag?> findByID(String id);
  Future<Tag?> findByName(String name);
  Future<Iterable<Tag>> getAll();
  Future<Tag> save(Tag tag);
}
