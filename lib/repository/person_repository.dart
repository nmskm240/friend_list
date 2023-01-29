import 'package:friend_list/entity/person.dart';

abstract class PersonRepository {
  Future<Person> save(Person person);
  Future<Person> findByID(int id);
  Future<void> deleteByID(int id);
  Future<Iterable<Person>> getAll();
}