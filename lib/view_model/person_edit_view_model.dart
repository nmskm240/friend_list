import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/person_data_edit_form.dart';

class PersonEditViewModel extends StateNotifier<PersonDataEditForm> {
  PersonEditViewModel() : super(const PersonDataEditForm());

  GlobalKey get basicInfoFormKey => state.nameAndIconKey;
  GlobalKey get anniversaryListFormKey => state.anniversaryListKey;
  GlobalKey get contactListFormKey => state.contactListKey;

  void onCompleted() async {
    if(state.isValidated) {
      await state.save();
    }
  }
}