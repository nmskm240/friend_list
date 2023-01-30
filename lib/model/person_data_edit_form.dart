import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/repository/person_repository_by_local_database.dart';

part 'person_data_edit_form.freezed.dart';

@freezed
class PersonDataEditForm with _$PersonDataEditForm {
  const PersonDataEditForm._();
  const factory PersonDataEditForm({
    @Default(GlobalObjectKey<FormBuilderState>("basic_data"))
        GlobalObjectKey<FormBuilderState> nameAndIconKey,
    @Default(GlobalObjectKey<FormBuilderState>("anniversary_list"))
        GlobalObjectKey<FormBuilderState> anniversaryListKey,
    @Default(GlobalObjectKey<FormBuilderState>("contact_list"))
        GlobalObjectKey<FormBuilderState> contactListKey,
  }) = _PersonDataEditFormState;

  bool get isValidated {
    return [
      nameAndIconKey,
      anniversaryListKey,
      contactListKey,
    ].every((element) => element.currentState!.validate());
  }

  Future<void> save() async {
    nameAndIconKey.currentState!.save();
    anniversaryListKey.currentState!.save();
    contactListKey.currentState!.save();
    final entity = toEntity();
    await PersonRepositoryByLocalDatbase().save(entity);
  }

  Person toEntity() {
    final basicInfo = nameAndIconKey.currentState!.fields;
    final anniversaries =
        anniversaryListKey.currentState!.fields.entries
            .where((e) => e.value.value != null)
            .map((e) => Anniversary(
                  name: e.key,
                  date: DateTime.parse(e.value.value),
                ))
            .toList();
    final contacts = contactListKey.currentState!.fields.entries
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
