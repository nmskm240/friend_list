import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/common/constant/strings.dart';

class AnniversaryEditPageNotifier {
  final bool Function(String) isDuplicated;
  @protected
  final void Function(String, DateTime) onSave;

  const AnniversaryEditPageNotifier({
    required this.isDuplicated,
    required this.onSave,
  });

  void onPressedSaveButton(GlobalKey<FormBuilderState> formKey) {
    if (formKey.currentState!.validate()) {
      final values = formKey.currentState!.instantValue;
      onSave(values[Strings.formFieldName], values[Strings.formFieldDate]);
    }
  }
}
