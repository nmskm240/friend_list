import 'package:friend_list/util/validator/i_validatable.dart';

class EmailValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the friend email";
    } else if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return null;
    } else {
      return "Email address is not in the correct format";
    }
  }
}
