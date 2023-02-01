import 'package:friend_list/domain/tag/tag.dart';

abstract class ITagRepository {
  Future<Tag?> findByID(int id);
  Future<Tag?> findByName(String name);
  Future<Iterable<Tag>> getAll();
  Future<Tag> save(Tag tag);
}
