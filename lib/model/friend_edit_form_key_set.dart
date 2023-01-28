import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_edit_form_key_set.freezed.dart';

@freezed
abstract class FriendEditFormKeySet implements _$FriendEditFormKeySet {
  const FriendEditFormKeySet._();
  const factory FriendEditFormKeySet({
    @Default(GlobalObjectKey<FormBuilderState>("basic_info"))
        GlobalObjectKey<FormBuilderState> basicInfoFormKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_anniversary_list"))
        GlobalObjectKey<FormBuilderState> registeredAnniversaryListKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_contact_list"))
        GlobalObjectKey<FormBuilderState> registeredContactListKey,
  }) = _FriendEditFormKeySet;

  bool get isValidated {
    final isValidatedBasicInfo = basicInfoFormKey.currentState!.validate();
    final isValidatedRegisteredAnniversaryList =
        registeredAnniversaryListKey.currentState!.validate();
    final isValidatedRegisteredContactList =
        registeredContactListKey.currentState!.validate();
    return isValidatedBasicInfo &&
        isValidatedRegisteredAnniversaryList &&
        isValidatedRegisteredContactList;
  }

  void save() {
    basicInfoFormKey.currentState!.save();
    registeredAnniversaryListKey.currentState!.save();
    registeredContactListKey.currentState!.save();
    //TODO: save process
  }
}
