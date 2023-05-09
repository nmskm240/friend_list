import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';

class ContactEditPageNotifier {
  final bool Function(ContactMethod, String) isDuplicated;
  @protected
  final void Function(String, ContactMethod, String) onSave;

  const ContactEditPageNotifier({
    required this.isDuplicated,
    required this.onSave,
  });

  void onPressedSaveButton(GlobalKey<FormBuilderState> formKey) {
    if (formKey.currentState!.validate()) {
      final values = formKey.currentState!.instantValue;
      if (isDuplicated(
          values[Strings.formFieldMethod], values[Strings.formFieldValue])) {
        formKey.currentState!.fields[Strings.formFieldMethod]!
            .invalidate(Strings.duplicateContact);
        formKey.currentState!.fields[Strings.formFieldValue]!
            .invalidate(Strings.duplicateContact);
        return;
      }
      onSave(
        "",
        values[Strings.formFieldMethod],
        values[Strings.formFieldValue],
      );
    }
  }
}
