import 'package:friend_list/entity/contact.dart';

abstract class ContactRepository {
  Future<Contact> save(Contact element);
  Future<Contact> findByID(int id);
  Future<void> deleteByID(int id);
  Future<Iterable<Contact>> getAllByFriendID(int friendID);
}