import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract class FormDialog {
  final String title;

  FormDialog({required this.title});

  List<Widget> buildFormFields();
  Map<String, dynamic> valueToMap();

  Future<Map<String, dynamic>?> show(BuildContext context) async {
    final formKey = GlobalKey<FormBuilderState>();
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: FormBuilder(
            key: formKey,
            child: SizedBox(
              height: 200,
              child: Column(
                children: buildFormFields(),
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("ok"),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Navigator.of(context).pop(valueToMap());
                }
              },
            ),
          ],
        );
      },
    );
  }
}
