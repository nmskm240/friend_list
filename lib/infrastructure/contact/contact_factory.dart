import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/contact/i_contact_factory.dart';
import 'package:uuid/uuid.dart';

class ContactFactory implements IContactFactory {
  @override
  Contact create(
      String name, ContactMethod method, String value, String personId) {
    return Contact(const Uuid().v1(), name, method, value, personId);
  }
}
