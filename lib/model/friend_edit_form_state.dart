import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository_by_local_database.dart';

part 'friend_edit_form_state.freezed.dart';

@freezed
abstract class FriendEditFormState implements _$FriendEditFormState {
  const FriendEditFormState._();
  const factory FriendEditFormState({
    @Default(GlobalObjectKey<FormBuilderState>("basic_info"))
        GlobalObjectKey<FormBuilderState> basicInfoFormKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_anniversary_list"))
        GlobalObjectKey<FormBuilderState> registeredAnniversaryListKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_contact_list"))
        GlobalObjectKey<FormBuilderState> registeredContactListKey,
  }) = _FriendEditFormState;

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

  Future<void> save() async {
    basicInfoFormKey.currentState!.save();
    registeredAnniversaryListKey.currentState!.save();
    registeredContactListKey.currentState!.save();
    final entiry = toEntity();
    await FriendRepositoryByLocalDatbase().save(entiry);
  }

  Friend toEntity() {
    final basicInfo = basicInfoFormKey.currentState!.fields;
    final anniversaries =
        registeredAnniversaryListKey.currentState!.fields.entries
            .where((e) => e.value.value != null)
            .map((e) => Anniversary(
                  name: e.key,
                  date: DateTime.parse(e.value.value),
                ))
            .toList();
    final contacts = registeredContactListKey.currentState!.fields.entries
        .map((e) => Contact(
              method: ContactMethodType.values.byName(e.key),
              value: e.value.value,
            ))
        .toList();
    return Friend(
      name: basicInfo["name"]!.value,
      nickname: basicInfo["nickname"]!.value,
      icon: basicInfo["icon"]!.value,
      anniversaries: anniversaries,
      contacts: contacts,
    );
  }
}
