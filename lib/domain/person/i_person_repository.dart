import 'package:friend_list/domain/person/person.dart';

abstract class IPersonRepository {
  Future<void> attachTags(String id, List<String> tagIds);
  Future<void> deleteAll();
  Future<void> deleteByID(String id);
  Future<Person> findByID(String id);
  Future<Iterable<Person>> findByNameOrNickname(String value);
  Future<Iterable<Person>> getAll();
  Future<Iterable<String>> getAttachedTagIDs(String id);
  Future<void> removeTags(String id, List<String> tagIds);
  Future<Person> save(Person person);
}
