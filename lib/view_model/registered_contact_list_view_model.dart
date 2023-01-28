import 'package:flutter/material.dart';
import 'package:friend_list/component/dialog/confirm_dialog.dart';
import 'package:friend_list/component/dialog/contact_form_dialog.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/model/registered_contact_list.dart';
import 'package:friend_list/util/validator/contact_validator.dart';

class RegisteredContactListViewModel extends ChangeNotifier {
  RegisteredContactList _model;

  RegisteredContactListViewModel(this._model);

  Iterable<Contact> get contacts => _model.contacts;

  String? contactValidate(Contact value) {
    return ContactValidator().validate(value);
  }

  Future<void> createContact(BuildContext context) async {
    final json = await ContactFormDialog().show(context);
    if (json == null) {
      return;
    }
    final newContact = Contact(method: json["method"], value: json["value"]);
    _model = _model.copyWith(
      contacts: [
        ..._model.contacts,
        newContact,
      ],
    );
    notifyListeners();
  }

  Future<void> deleteContact(BuildContext context, Contact contact) async {
    final isAccept = await ConfirmDialog(
            "Confirm", "Do you want to delete the ${contact.method.name} ?")
        .show(context);
    if (isAccept) {
      final contacts = List<Contact>.from(_model.contacts);
      contacts.remove(contact);
      _model = _model.copyWith(
        contacts: contacts,
      );
      notifyListeners();
    }
  }
}
