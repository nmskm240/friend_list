import 'package:friend_list/util/validator/i_validatable.dart';

class NameValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if(value == null || value.isEmpty) {
      return "Enter the friend name";
    }
    return null;
  }
}