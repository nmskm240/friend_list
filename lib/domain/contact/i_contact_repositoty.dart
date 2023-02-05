import 'package:friend_list/domain/contact/contact.dart';

abstract class IContactRepository {
  Future<void> deleteAll();
  Future<void> deleteAllByPersonID(String personId);
  Future<void> deleteByID(String id);
  Future<Contact?> findByID(String id);
  Future<Iterable<Contact>> findAllByPersonID(String personId);
  Future<Contact> save(Contact contact);
}