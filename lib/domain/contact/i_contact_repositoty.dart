import 'package:friend_list/domain/contact/contact.dart';

abstract class IContactRepository {
  Future<Iterable<Contact>> findByPersonID(int personId);
  Future<Contact> save(Contact contact);
}