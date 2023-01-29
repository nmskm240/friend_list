import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/repository/person_repository_by_local_database.dart';

part 'person_data_edit_form_state.freezed.dart';

@freezed
class PersonDataEditFormState with _$PersonDataEditFormState {
  const PersonDataEditFormState._();
  const factory PersonDataEditFormState({
    @Default(GlobalObjectKey<FormBuilderState>("basic_info"))
        GlobalObjectKey<FormBuilderState> basicInfoFormKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_anniversary_list"))
        GlobalObjectKey<FormBuilderState> registeredAnniversaryListKey,
    @Default(GlobalObjectKey<FormBuilderState>("registered_contact_list"))
        GlobalObjectKey<FormBuilderState> registeredContactListKey,
  }) = _PersonDataEditFormState;

  bool get isValidated {
    return [
      basicInfoFormKey,
      registeredAnniversaryListKey,
      registeredContactListKey,
    ].every((element) => element.currentState!.validate());
  }

  Future<void> save() async {
    basicInfoFormKey.currentState!.save();
    registeredAnniversaryListKey.currentState!.save();
    registeredContactListKey.currentState!.save();
    final entiry = toEntity();
    debugPrint(entiry.toString());
    await PersonRepositoryByLocalDatbase().save(entiry);
  }

  Person toEntity() {
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
    return Person(
      name: basicInfo["name"]!.value,
      nickname: basicInfo["nickname"]!.value,
      icon: basicInfo["icon"]!.value,
      anniversaries: anniversaries,
      contacts: contacts,
    );
  }
}
