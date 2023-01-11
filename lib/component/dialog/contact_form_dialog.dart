import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/component/dialog/form_dialog.dart';
import 'package:friend_list/model/contact.dart';

class ContactFormDialog extends FormDialog {
  late ContactMethodType method;
  late String value;

  ContactFormDialog() : super(title: "New Contact");

  Iterable<DropdownMenuItem<ContactMethodType>> createItems() {
    return ContactMethodType.values.map((e) {
      return DropdownMenuItem(
        value: e,
        child: Text(e.name),
      );
    });
  }

  @override
  List<Widget> buildFormFields() {
    return [
      FormBuilderDropdown<ContactMethodType>(
        name: "type",
        items: createItems().toList(),
        decoration: const InputDecoration(
          label: Text("method"),
        ),
        validator: (value) {
          if (value == null) {
            return "Please select a contact type";
          }
          return null;
        },
        onSaved: (newValue) {
          method = newValue!;
        },
      ),
      FormBuilderTextField(
        name: "id",
        decoration: const InputDecoration(
          label: Text("value"),
        ),
        validator: (value) {
          if (value == null) {
            return "Please enter the id";
          }
          return null;
        },
        onSaved: (newValue) {
          value = newValue!;
        },
      ),
    ];
  }

  @override
  Map<String, dynamic> valueToMap() {
    return {
      "method": method,
      "value": value,
    };
  }
}
