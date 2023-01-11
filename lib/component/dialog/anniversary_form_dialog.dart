import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/component/dialog/form_dialog.dart';

class AnniversaryFormDialog extends FormDialog {
  late String name;
  late DateTime date;

  AnniversaryFormDialog() : super(title: "New Anniversary");

  @override
  List<Widget> buildFormFields() {
    return [
      FormBuilderTextField(
        name: "name",
        decoration: const InputDecoration(
          label: Text("name"),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter an anniversary name";
          }
          return null;
        },
        onSaved: (newValue) {
          name = newValue!;
        },
      ),
      FormBuilderDateTimePicker(
        name: "date",
        decoration: const InputDecoration(
          label: Text("date"),
        ),
        inputType: InputType.date,
        validator: (value) {
          if (value == null) {
            return "Please enter an anniversary date";
          }
          return null;
        },
        onSaved: (newValue) {
          date = newValue!;
        },
      ),
    ];
  }

  @override
  Map<String, dynamic> valueToMap() {
    return {
      "name": name,
      "date": date,
    };
  }
}
