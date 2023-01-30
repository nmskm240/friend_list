import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/util/validator/email_validator.dart';
import 'package:friend_list/util/validator/i_validatable.dart';
import 'package:friend_list/util/validator/location_validator.dart';
import 'package:friend_list/util/validator/phone_validator.dart';
import 'package:friend_list/util/validator/sns_validator.dart';

class ContactValidator implements IValidatable<Contact> {
  @override
  String? validate(Contact contact) {
    late final IValidatable validator;
    switch (contact.method) {
      case ContactMethodType.email:
        validator = EmailValidator();
        break;
      case ContactMethodType.phone:
        validator = PhoneValidator();
        break;
      case ContactMethodType.facebook:
      case ContactMethodType.twitter:
      case ContactMethodType.instagram:
        validator = SnsValidator();
        break;
      case ContactMethodType.address:
        validator = LocationValidator();
        break;
      default:
        throw Exception("Unregistered Contacts");
    }
    return validator.validate(contact.value);
  }
}
