import 'package:friend_list/domain/person/person.dart';

abstract class IPersonRepository {
  Future<Person?> findByID(int id);
  Future<Iterable<Person>> findByNameOrNickname(String name,
      {bool isParticalMatch = false});
  Future<Iterable<Person>> getAll();
  Future<Person> save(Person person);
}
