import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/local_database/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/infrastructure/local_database/person/contact/contact_factory.dart';
import 'package:friend_list/infrastructure/shared_preferences/app_shared_preferences.dart';
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
    final defaultIcon = ref.read(sharedPreferences).getDefaultIcon();
    state = state.copyWith
        .person(icon: newIcon ?? defaultIcon);
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
    final added = state.person.addAnniversary(res);
    state = state.copyWith.person(anniversaries: added.toList());
  }

  Future<void> onPressedEditAnniversary(Anniversary anniversary) async {
    final route =
        AnniversaryEditRoute(person: state.person, anniversary: anniversary);
    final res = await ref.read(router).push<Anniversary>(route);
    if (res == null) {
      return;
    }
    final edited = state.person.editAnniversary(res);
    state = state.copyWith.person(anniversaries: edited.toList());
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
