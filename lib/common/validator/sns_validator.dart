import 'package:friend_list/common/validator/i_validatable.dart';

class SnsValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the person`s ID";
    } else if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9_]").hasMatch(value)) {
      return null;
    } else {
      return "This ID is not in the correct format";
    }
  }
}
