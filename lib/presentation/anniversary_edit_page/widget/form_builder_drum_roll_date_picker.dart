import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:intl/intl.dart';

class FormBuilderDrumRollDatePicker extends StatelessWidget {
  final String name;
  final String? Function(DateTime?)? validator;
  final DateTime? initalValue;

  const FormBuilderDrumRollDatePicker({
    super.key,
    required this.name,
    this.initalValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
      name: name,
      initialValue: initalValue,
      validator: validator,
      builder: (field) {
        return InputDecorator(
          decoration: InputDecoration(
            label: const Text(Strings.anniversaryEditPageFormDateLabel),
            errorText: field.errorText,
          ),
          child: GestureDetector(
            child: Text(
              field.value == null ? "" : DateFormat.yMd().format(field.value!),
            ),
            onTap: () async {
              final value = await DatePicker.showDatePicker(
                context,
                currentTime: field.value,
                maxTime: DateTime.now(),
              );
              field.didChange(value);
            },
          ),
        );
      },
    );
  }
}
