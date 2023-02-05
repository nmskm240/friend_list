import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/domain/contact/i_contact_repositoty.dart';

class InMemoryContactRepository implements IContactRepository {
  final List<Contact> contacts;

  const InMemoryContactRepository(this.contacts);

  @override 
  Future<void> deleteAll() async {
    contacts.clear();
  }

  @override
  Future<void> deleteAllByPersonID(String personId) async {
    contacts.removeWhere((element) => element.personId == personId);
  }

  @override
  Future<void> deleteByID(String id) async {
    contacts.removeWhere((element) => element.id == id);
  }

  @override
  Future<Contact?> findByID(String id) async {
    final results = contacts.where((element) => element.id == id);
    return results.isEmpty ? null : results.first;
  }

  @override
  Future<Iterable<Contact>> findAllByPersonID(String personId) async {
    return contacts.where((element) => element.personId == personId);
  }

  @override
  Future<Contact> save(Contact contact) async {
    if (contacts.where((element) => element.id == contact.id).isEmpty) {
      contacts.add(contact);
    } else {
      final index = contacts.indexWhere((element) => element.id == contact.id);
      contacts.removeAt(index);
      contacts.insert(index, contact);
    }
    return contact;
  }
}
