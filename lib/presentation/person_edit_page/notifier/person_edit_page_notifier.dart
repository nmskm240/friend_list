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
import 'package:sprintf/sprintf.dart';

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
    state = state.copyWith
        .person(icon: newIcon ?? SharedPreferencesHelper.getDefaultIcon());
  }

  void onChangedName(String? newName) {
    state = state.copyWith.person(name: newName ?? "");
  }

  void onChangedNickname(String? newNickname) {
    state = state.copyWith.person(nickname: newNickname ?? "");
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
    var added = state.person.addAnniversary(res);
    state = state.copyWith(person: added);
  }

  Future<void> onPressedEditAnniversary(Anniversary anniversary) async {
    final route =
        AnniversaryEditRoute(person: state.person, anniversary: anniversary);
    final res = await ref.read(router).push<Anniversary>(route);
    if (res == null) {
      return;
    }
    var edited = state.person.editAnniversary(res);
    var copy = state.copyWith.person(anniversaries: edited.toList());
    debugPrint(sprintf("edited: %s", [edited.toString()]));
    debugPrint(sprintf("copy: %s", [copy.anniversaries.toString()]));
    state = copy;
    debugPrint(sprintf("state: %s", [state.anniversaries.toString()]));
  }

  void onPressedDeletAnniversary(Anniversary anniversary) {
    var removed = state.person.removeAnniversary(anniversary.id);
    state = state.copyWith(person: removed);
  }

  Future<void> onPressedAddContact() async {
    final factory = ContactFactory();
    final contact = factory.create(state.person.id);
    final route = ContactEditRoute(person: state.person, contact: contact);
    final res = await ref.read(router).push<Contact>(route);
    if (res == null) {
      return;
    }
    var added = state.person.addContact(res);
    state = state.copyWith(person: added);
  }

  Future<void> onPressedEditContact(Contact contact) async {
    final route = ContactEditRoute(person: state.person, contact: contact);
    final res = await ref.read(router).push<Contact>(route);
    if (res == null) {
      return;
    }
    var edited = state.person.editContact(res);
    state = state.copyWith(person: edited);
  }

  void onPressedDeletContact(Contact contact) {
    var removed = state.person.removeContact(contact.id);
    state = state.copyWith(person: removed);
  }
}
