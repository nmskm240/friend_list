import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/person_data_edit_form_state.dart';

class PersonEditViewModel extends StateNotifier<PersonDataEditFormState> {
  PersonEditViewModel() : super(const PersonDataEditFormState());

  GlobalKey get basicInfoFormKey => state.basicInfoFormKey;
  GlobalKey get anniversaryListFormKey => state.registeredAnniversaryListKey;
  GlobalKey get contactListFormKey => state.registeredContactListKey;

  void onCompleted() async {
    if(state.isValidated) {
      await state.save();
    }
  }
}