import 'package:friend_list/util/validator/i_validatable.dart';

class SnsValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the friend`s ID";
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9_]").hasMatch(value)) {
      return null;
    } else {
      return "This ID is not in the correct format";
    }
  }
}
