import 'package:friend_list/domain/contact/contact.dart';

abstract class IContactRepository {
  Future<void> deleteAllByPersonID(String personId);
  Future<void> deleteByID(String id);
  Future<Iterable<Contact>> findByPersonID(String personId);
  Future<Contact> save(Contact contact);
}