import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend_edit_form_state.dart';

class FriendEditPageViewModel extends StateNotifier<FriendEditFormState> {
  FriendEditPageViewModel() : super(const FriendEditFormState());

  GlobalKey get basicInfoFormKey => state.basicInfoFormKey;
  GlobalKey get anniversaryListFormKey => state.registeredAnniversaryListKey;
  GlobalKey get contactListFormKey => state.registeredContactListKey;

  void onCompleted() async {
    if(state.isValidated) {
      await state.save();
    }
  }
}