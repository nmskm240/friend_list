import 'package:friend_list/domain/contact/contact.dart';

abstract class IContactRepository {
  Future<void> deleteAllByPersonID(int personId);
  Future<void> deleteByID(int id);
  Future<Iterable<Contact>> findByPersonID(int personId);
  Future<Contact> save(Contact contact);
}