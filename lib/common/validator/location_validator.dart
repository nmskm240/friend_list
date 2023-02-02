import 'package:friend_list/common/validator/i_validatable.dart';

class LocationValidator implements IValidatable<String?> {
  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the person location";
    }
    return null;
  }
}
