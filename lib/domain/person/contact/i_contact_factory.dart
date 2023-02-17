import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/person/contact/contact.dart';

abstract class IContactFactory {
  Contact create(String name, ContactMethod method, String value, String personId);
}