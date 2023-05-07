import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/presentation/anniversary_edit_page/notifier/anniversary_edit_page_notifier.dart';
import 'package:friend_list/presentation/anniversary_edit_page/widget/form_builder_drum_roll_date_picker.dart';

@RoutePage()
class AnniversaryEditPage extends StatelessWidget {
  @protected
  final AnniversaryEditPageNotifier notifier;
  @protected
  final Anniversary? state;

  AnniversaryEditPage({
    super.key,
    this.state,
    required bool Function(String) isDuplicated,
    required void Function(String, DateTime) onSave,
  }) : notifier = AnniversaryEditPageNotifier(
          isDuplicated: isDuplicated,
          onSave: onSave,
        );

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => notifier.onPressedSaveButton(key),
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
                initialValue: state?.name,
                readOnly: state == null ? false: state!.isBirthdate,
                decoration: const InputDecoration(
                  label: Text("name"),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  (val) => notifier.isDuplicated(val!)
                      ? "Can`t register same name anniversary."
                      : null,
                ]),
              ),
              FormBuilderDrumRollDatePicker(
                name: "date",
                initalValue: state?.date,
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
