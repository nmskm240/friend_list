import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend_edit_form_key_set.dart';

class FriendEditPageViewModel extends StateNotifier<FriendEditFormKeySet> {
  FriendEditPageViewModel() : super(const FriendEditFormKeySet());

  GlobalKey get basicInfoFormKey => state.basicInfoFormKey;
  GlobalKey get anniversaryListFormKey => state.registeredAnniversaryListKey;
  GlobalKey get contactListFormKey => state.registeredContactListKey;

  void onCompleted() {
    if(state.isValidated) {
      state.save();
    }
  }
}