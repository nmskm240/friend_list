import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/anniversary_edit_settings.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/application/model/contact_edit_settings.dart';
import 'package:friend_list/application/navigation_service.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

class PersonEditPageNotifier extends StateNotifier<PersonEditPageState> {
  final PersonAppService _service;
  final NavigationService _navigator;

  PersonEditPageNotifier({
    required PersonAppService service,
    required NavigationService navigator,
  })  : _service = service,
        _navigator = navigator,
        super(PersonEditPageState(person: service.createEmpty()));

  Future<void> onPressedSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState!.validate()) {
      final fields = formKey.currentState!.instantValue;
      await _service.savePerson(
          fields["name"], fields["nickname"], fields["icon"], [], []);
      await _navigator.pop();
    }
  }

  Future<void> onPressedAddAnniversary() async {
    final res = await _navigator.push<AnniversaryDto>("/anniversary/edit");
    if (res == null) {
      return;
    }
    state.person.addAnniversary(res.name, res.date);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditAnniversary(
      AnniversaryEditSettings settings) async {
    final res = await _navigator.push<AnniversaryDto>(
      "/anniversary/edit",
      arguments: settings,
    );
    if (res == null) {
      return;
    }
    if (state.person.hasSameAnniversaryByName("birthdate")) {
      state.person.editAnniversary(res.id, name: res.name, date: res.date);
    } else {
      state.person.addAnniversary(res.name, res.date);
    }
    state = state.copyWith(shouldRefreshWidget: true);
  }

  void onPressedDeletAnniversary(AnniversaryEditSettings settings) {
    final target = state.person.findAnniversaryByName(settings.name);
    state.person.removeAnniversary(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedAddContact() async {
    final res = await _navigator.push<ContactDto>(
      "/contact/edit",
    );
    if (res == null) {
      return;
    }
    state.person.addContact(res.name, res.method, res.value);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditContact(ContactEditSettings settings) async {
    final res = await _navigator.push<ContactDto>(
      "contact/edit",
      arguments: settings,
    );
    if (res == null) {
      return;
    }
    state.person.editContact(
      res.id,
      name: res.name,
      method: res.method,
      value: res.value,
    );
  }

  void onPressedDeletContact(ContactEditSettings settings) {
    final target = state.person.findContactByMethodAndValue(
      settings.method,
      settings.value,
    );
    state.person.removeContact(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }
}
