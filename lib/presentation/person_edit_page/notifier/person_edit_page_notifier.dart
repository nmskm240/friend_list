import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

class PersonEditPageNotifier extends StateNotifier<PersonEditPageState> {
  @protected
  final Ref ref;

  PersonEditPageNotifier(
    this.ref, {
    required Person domain,
  }) : super(PersonEditPageState(person: domain));

  void onChangedName(String? newName) {
    state.person.name = newName ?? "";
  }

  void onChangedNickname(String? newNickname) {
    state.person.nickname = newNickname ?? "";
  }

  Future<void> onPressedAddAnniversary() async {
    final res = await ref
        .read(router)
        .push<Anniversary>(AnniversaryEditRoute(person: state.person));
    if (res == null) {
      return;
    }
    state.person.addAnniversary(
      res.name,
      res.date,
    );
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditAnniversary(Anniversary anniversary) async {
    final res = await ref.read(router).push<Anniversary>(
        AnniversaryEditRoute(person: state.person, anniversary: anniversary));
    if (res == null) {
      return;
    }
    state.person.editAnniversary(res.id, name: res.name, date: res.date);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  void onPressedDeletAnniversary(Anniversary anniversary) {
    final target = state.person.findAnniversaryByName(anniversary.name);
    state.person.removeAnniversary(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedAddContact() async {
    final res = await ref
        .read(router)
        .push<Contact>(ContactEditRoute(person: state.person));
    if (res == null) {
      return;
    }
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditContact(Contact contact) async {
    final res = await ref.read(router).push<Contact>(
        ContactEditRoute(person: state.person, contact: contact));
    if (res == null) {
      return;
    }
    state = state.copyWith(shouldRefreshWidget: true);
  }

  void onPressedDeletContact(Contact contact) {
    final target = state.person.findContactByMethodAndValue(
      contact.method,
      contact.value,
    );
    state.person.removeContact(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }
}
