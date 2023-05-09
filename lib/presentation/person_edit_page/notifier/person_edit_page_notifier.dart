import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/model/anniversary_edit_settings.dart';
import 'package:friend_list/application/model/contact_edit_settings.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

class PersonEditPageNotifier extends StateNotifier<PersonEditPageState> {
  final PersonAppService _service;
  final AppRouter _router;

  PersonEditPageNotifier({
    required PersonAppService service,
    required AppRouter router,
    Person? domain,
  })  : _service = service,
        _router = router,
        super(PersonEditPageState(person: domain ?? service.createEmpty()));

  void onChangedName(String? newName) {
    state.person.name = newName ?? "";
  }

  void onChangedNickname(String? newNickname) {
    state.person.nickname = newNickname ?? "";
  }

  Future<void> onPressedSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState!.validate()) {
      await _service.savePerson(state.person);
      await _router.pop();
    }
  }

  Future<void> onPressedAddAnniversary() async {
    final route = AnniversaryEditRoute(
      isDuplicated: state.person.hasSameAnniversaryByName,
      onSave: (name, date) {
        state.person.addAnniversary(name, date);
        _router.pop();
      },
    );
    await _router.push(route);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditAnniversary(
    AnniversaryEditSettings settings,
  ) async {
    final route = AnniversaryEditRoute(
      isDuplicated: (newName) =>
          newName != settings.name &&
          state.person.hasSameAnniversaryByName(newName),
      onSave: (name, date) {
        state.person.editAnniversary(settings.id, name: name, date: date);
        _router.pop();
      },
    );
    await _router.push(route);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  void onPressedDeletAnniversary(AnniversaryEditSettings settings) {
    final target = state.person.findAnniversaryByName(settings.name);
    state.person.removeAnniversary(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedAddContact() async {
    final route = ContactEditRoute(
      isDuplicated: state.person.hasSameContactByMethodAndValue,
      onSave: (label, method, value) {
        state.person.addContact(label, method, value);
        _router.pop();
      },
    );
    await _router.push(route);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditContact(ContactEditSettings settings) async {
    final route = ContactEditRoute(
      isDuplicated: (method, value) =>
          (method != settings.method || value != settings.value) &&
          state.person.hasSameContactByMethodAndValue(method, value),
      onSave: (label, method, value) {
        state.person.editContact(
          settings.id,
          name: label,
          method: method,
          value: value,
        );
      },
    );
    await _router.push(route);
    state = state.copyWith(shouldRefreshWidget: true);
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
