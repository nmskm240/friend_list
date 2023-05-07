import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/common/constant/contact_method.dart';

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
      if (isDuplicated(values["method"], values["value"])) {
        formKey.currentState!.fields["method"]!
            .invalidate("Can`t register same method and value contact.");
        formKey.currentState!.fields["value"]!
            .invalidate("Can`t register same method and value contact.");
        return;
      }
      onSave("", values["method"], values["value"]);
    }
  }
}
