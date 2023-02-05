import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/contact/i_contact_factory.dart';

class AutoIncrementContactFactory implements IContactFactory {
  int count = 0;

  @override
  Contact create(
      String name, ContactMethod method, String value, String personId) {
    return Contact(count.toString(), name, method, value, personId);
  }
}
