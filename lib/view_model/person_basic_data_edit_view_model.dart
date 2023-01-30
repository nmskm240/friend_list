import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/name_and_icon.dart';
import 'package:friend_list/util/validator/name_validator.dart';

class PersonBasicDataViewModel extends StateNotifier<NameAndIcon> {
  PersonBasicDataViewModel() : super(const NameAndIcon());

  String get name => state.name;
  String get nickname => state.nickname;
  String get icon => state.icon;

  set name(String? value) => state = state.copyWith(name: value ?? "");
  set nickname(String? value) => state = state.copyWith(nickname: value ?? "");
  set icon(String? value) => state = state.copyWith(icon: value ?? "");

  String? nameValidator(String? value) {
    return NameValidator().validate(value);
  }
}
