import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/application/model/anniversary_dto.dart';
import 'package:friend_list/application/model/anniversary_edit_settings.dart';
import 'package:friend_list/presentation/anniversary_edit_page/widget/form_builder_drum_roll_date_picker.dart';

@RoutePage()
class AnniversaryEditPage extends StatelessWidget {
  const AnniversaryEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as AnniversaryEditSettings?;
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (key.currentState!.validate()) {
                final values = key.currentState!.instantValue;
                final dto = AnniversaryDto(
                  id: args == null ? "" : args.id,
                  name: values["name"],
                  date: values["date"],
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
            children: [
              FormBuilderTextField(
                name: "name",
                initialValue: args?.name,
                readOnly: args == null ? false : !args.canChangeName,
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
                validator: FormBuilderValidators.required(),
              ),
              FormBuilderDrumRollDatePicker(
                name: "date",
                initalValue: args?.date,
                validator: FormBuilderValidators.required(),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
