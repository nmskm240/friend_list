import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/model/anniversary_edit_settings.dart';
import 'package:friend_list/application/model/contact_edit_settings.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

class PersonEditPageNotifier
    extends StateNotifier<AsyncValue<PersonEditPageState>> {
  final PersonAppService _service;
  final AppRouter _router;

  PersonEditPageNotifier({
    required PersonAppService service,
    required AppRouter router,
    String? id,
  })  : _service = service,
        _router = router,
        super(const AsyncValue.loading()) {
    _init(id);
  }

  Future<void> _init(String? id) async {
    state = await AsyncValue.guard(() async {
      if (id == null || id.isEmpty) {
        final domain = _service.createEmpty();
        return PersonEditPageState(person: domain);
      } else {
        final domain = await _service.findPersonById(id);
        return PersonEditPageState(person: domain);
      }
    });
  }

  void onChangedName(String? newName) {
    state.value!.person.name = newName ?? "";
  }

  void onChangedNickname(String? newNickname) {
    state.value!.person.nickname = newNickname ?? "";
  }

  Future<void> onPressedSave(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState!.validate()) {
      await _service.savePerson(state.value!.person);
      await _router.pop();
    }
  }

  Future<void> onPressedAddAnniversary() async {
    final route = AnniversaryEditRoute(
      isDuplicated: state.value!.person.hasSameAnniversaryByName,
      onSave: (name, date) {
        state.value!.person.addAnniversary(name, date);
        _router.pop();
      },
    );
    await _router.push(route);
    state = AsyncValue.data(state.value!);
  }

  Future<void> onPressedEditAnniversary(
    AnniversaryEditSettings settings,
  ) async {
    final route = AnniversaryEditRoute(
      isDuplicated: (newName) =>
          newName != settings.name &&
          state.value!.person.hasSameAnniversaryByName(newName),
      onSave: (name, date) {
        state.value!.person
            .editAnniversary(settings.id, name: name, date: date);
        _router.pop();
      },
    );
    await _router.push(route);
    state = AsyncValue.data(state.value!);
  }

  void onPressedDeletAnniversary(AnniversaryEditSettings settings) {
    final target = state.value!.person.findAnniversaryByName(settings.name);
    state.value!.person.removeAnniversary(target.id);
    state = AsyncValue.data(state.value!);
  }

  Future<void> onPressedAddContact() async {
    final route = ContactEditRoute(
      isDuplicated: state.value!.person.hasSameContactByMethodAndValue,
      onSave: (label, method, value) {
        state.value!.person.addContact(label, method, value);
        _router.pop();
      },
    );
    await _router.push(route);
    state = AsyncValue.data(state.value!);
  }

  Future<void> onPressedEditContact(ContactEditSettings settings) async {
    final route = ContactEditRoute(
      isDuplicated: (method, value) =>
          (method != settings.method || value != settings.value) &&
          state.value!.person.hasSameContactByMethodAndValue(method, value),
      onSave: (label, method, value) {
        state.value!.person.editContact(
          settings.id,
          name: label,
          method: method,
          value: value,
        );
      },
    );
    await _router.push(route);
    state = AsyncValue.data(state.value!);
  }

  void onPressedDeletContact(ContactEditSettings settings) {
    final target = state.value!.person.findContactByMethodAndValue(
      settings.method,
      settings.value,
    );
    state.value!.person.removeContact(target.id);
    state = AsyncValue.data(state.value!);
  }
}
