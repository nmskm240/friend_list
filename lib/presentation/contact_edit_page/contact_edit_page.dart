import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/application/model/contact_dto.dart';
import 'package:friend_list/application/model/contact_edit_settings.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/presentation/contact_edit_page/widgets/form_bulder_modal_bottom_sheet.dart';

class ContactEditPage extends StatelessWidget {
  const ContactEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ContactEditSettings?;
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (key.currentState!.validate()) {
                final values = key.currentState!.instantValue;
                final dto = ContactDto(
                  id: args == null ? "" : args.id,
                  name: "",
                  method: values["method"],
                  value: values["value"],
                );
                Navigator.of(context).pop(dto);
              }
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              FormBuilderModalBottomSheet<ContactMethod>(
                name: "method",
                initialValue: args?.method,
                validator: FormBuilderValidators.required(),
                values: ContactMethod.values,
              ),
              FormBuilderTextField(
                name: "value",
                initialValue: args?.value,
                decoration: const InputDecoration(
                  label: Text("value"),
                ),
                validator: FormBuilderValidators.required(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
