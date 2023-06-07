import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/domain/person/contact/contact.dart';

abstract class IContactFactory {
  Contact create(String personId, {String name = "", ContactMethod method = ContactMethod.unknown, String value = ""});
}