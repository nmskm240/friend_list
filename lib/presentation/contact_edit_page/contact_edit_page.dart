import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/presentation/contact_edit_page/notifier/contact_edit_page_notifier.dart';
import 'package:friend_list/presentation/contact_edit_page/widgets/form_bulder_modal_bottom_sheet.dart';

@RoutePage()
class ContactEditPage extends StatelessWidget {
  @protected
  final ContactEditPageNotifier notifier;
  @protected
  final Contact? state;

  ContactEditPage({
    super.key,
    this.state,
    required bool Function(ContactMethod, String) isDuplicated,
    required void Function(String, ContactMethod, String) onSave,
  }) : notifier = ContactEditPageNotifier(
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
            children: <Widget>[
              FormBuilderModalBottomSheet<ContactMethod>(
                name: Strings.formFieldMethod,
                initialValue: state?.method,
                validator: FormBuilderValidators.required(),
                values: ContactMethod.values,
              ),
              FormBuilderTextField(
                name: Strings.formFieldValue,
                initialValue: state?.value,
                decoration: const InputDecoration(
                  label: Text(Strings.personDetailPageFormValueLabel),
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
