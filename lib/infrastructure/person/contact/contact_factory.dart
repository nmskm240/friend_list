import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/person/contact/i_contact_factory.dart';
import 'package:uuid/uuid.dart';

class ContactFactory implements IContactFactory {
  @override
  Contact create(
      String name, ContactMethod method, String value, String personId) {
    return Contact(
      id: const Uuid().v1(),
      name: name,
      method: method,
      value: value,
      personId: personId,
    );
  }
}
