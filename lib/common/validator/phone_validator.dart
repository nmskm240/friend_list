import 'package:friend_list/common/validator/i_validatable.dart';

class PhoneValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the person phone number";
    } else if (RegExp(r"^0[-\d]{9,12}").hasMatch(value)) {
      return null;
    } else {
      return "Phone number is not in the correct format";
    }
  }
}
