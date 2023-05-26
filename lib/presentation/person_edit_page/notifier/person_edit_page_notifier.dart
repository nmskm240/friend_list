import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/infrastructure/person/contact/contact_factory.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_page_provider.dart';

class PersonEditPageNotifier extends StateNotifier<PersonEditPageState> {
  @protected
  final Ref ref;

  PersonEditPageNotifier(
    this.ref, {
    required Person domain,
  }) : super(PersonEditPageState(
          person: domain,
          key: GlobalKey<FormBuilderState>(),
        ));

  Future<void> onPressedSave() async {
    if (state.validate()) {
      await ref.read(personRepository).save(state.person);
      ref.invalidate(personListPageProvider);
      ref.read(router).pop();
    }
  }

  void onChangedIcon(Uint8List? newIcon) {
    state.person.icon = newIcon ?? SharedPreferencesHelper.getDefaultIcon();
  }

  void onChangedName(String? newName) {
    state.person.name = newName ?? "";
  }

  void onChangedNickname(String? newNickname) {
    state.person.nickname = newNickname ?? "";
  }

  Future<void> onPressedAddAnniversary({String? name}) async {
    final factory = AnniversaryFactory();
    final anniversary = factory.create(state.person.id, name: name);
    final route =
        AnniversaryEditRoute(person: state.person, anniversary: anniversary);
    final res = await ref.read(router).push<Anniversary>(route);
    if (res == null) {
      return;
    }
    state.person.addAnniversary(res);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditAnniversary(Anniversary anniversary) async {
    final route =
        AnniversaryEditRoute(person: state.person, anniversary: anniversary);
    final res = await ref.read(router).push<Anniversary>(route);
    if (res == null) {
      return;
    }
    state.person.editAnniversary(res);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  void onPressedDeletAnniversary(Anniversary anniversary) {
    final target = state.person.findAnniversaryByName(anniversary.name);
    state.person.removeAnniversary(target.id);
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedAddContact() async {
    final factory = ContactFactory();
    final contact = factory.create(state.person.id);
    final route = ContactEditRoute(person: state.person, contact: contact);
    final res = await ref.read(router).push<Contact>(route);
    if (res == null) {
      return;
    }
    state = state.copyWith(shouldRefreshWidget: true);
  }

  Future<void> onPressedEditContact(Contact contact) async {
    final route = ContactEditRoute(person: state.person, contact: contact);
    final res = await ref.read(router).push<Contact>(route);
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
