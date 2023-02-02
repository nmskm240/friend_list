import 'package:friend_list/domain/person/person.dart';

abstract class IPersonRepository {
  Future<void> deleteByID(String id);
  Future<Person?> findByID(String id);
  Future<Iterable<Person>> findByNameOrNickname(String name,
      {bool isParticalMatch = false});
  Future<Iterable<Person>> getAll();
  Future<Person> save(Person person);
}
