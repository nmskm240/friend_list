import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend_basic_info.dart';

class FriendBasicInfoViewModel extends StateNotifier<FriendBasicInfo> {
  FriendBasicInfoViewModel() : super(const FriendBasicInfo());

  String get name => state.name;
  String get nickname => state.nickname;
  String get icon => state.icon;

  set name(String? value) => state = state.copyWith(name: value ?? "");
  set nickname(String? value) => state = state.copyWith(nickname: value ?? "");
  set icon(String? value) => state = state.copyWith(icon: value ?? "");

  String nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the friend name";
    }
    return "";
  }
}
