import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/contact_edit_page/state/contact_edit_page_state.dart';

class ContactEditPageNotifier extends StateNotifier<ContactEditPageState> {
  @protected
  Ref ref;

  ContactEditPageNotifier(this.ref, Person person, Contact contact)
      : super(ContactEditPageState(
            person: person,
            contact: contact,
          key: GlobalKey<FormBuilderState>(),
        ));

  Future<void> onPressedSave() async {
    if(state.validate()) {
      final res = state.save();
      ref.read(router).pop<Contact>(res);
    } else {
      state.onInvalid();
    }
  }
}