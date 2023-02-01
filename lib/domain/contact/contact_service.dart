import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/domain/contact/i_contact_repositoty.dart';

class ContactService {
  final IContactRepository repository;

  const ContactService(this.repository);

  Future<bool> isDuplicated(Contact contact) async {
    final searched = await repository.findByPersonID(contact.personId);
    return searched.any((element) =>
        element.method == contact.method && element.value == contact.value);
  }
}
