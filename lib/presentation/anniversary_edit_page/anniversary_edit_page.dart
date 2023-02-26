import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/presentation/anniversary_edit_page/widget/form_builder_drum_roll_date_picker.dart';

class AnniversaryEditPage extends StatelessWidget {
  const AnniversaryEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (key.currentState!.validate()) {
                debugPrint(key.currentState!.instantValue.toString());
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: key,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            FormBuilderTextField(
              name: "name",
              decoration: const InputDecoration(
                label: Text("name"),
              ),
              validator: FormBuilderValidators.required(),
            ),
            FormBuilderDrumRollDatePicker(
              name: "date",
              validator: FormBuilderValidators.required(),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
