import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/person/contact/contact_factory.dart';
import 'package:friend_list/presentation/contact_edit_page/widgets/form_bulder_modal_bottom_sheet.dart';

@RoutePage()
class ContactEditPage extends ConsumerWidget {
  @protected
  final Person person;
  @protected
  final Contact contact;

  ContactEditPage({
    super.key,
    required this.person,
    Contact? contact,
  }) : contact = contact ?? ContactFactory().create(person.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (!key.currentState!.validate()) {
                return;
              }
              final fields = key.currentState!.instantValue;
              if (person.hasSameContactById(contact.id)) {
                person.editContact(
                  contact.id,
                  method: fields[Strings.formFieldMethod],
                  value: fields[Strings.formFieldValue],
                );
              } else {
                if (person.hasSameContactByMethodAndValue(
                    fields[Strings.formFieldMethod],
                    fields[Strings.formFieldValue])) {
                  key.currentState!.fields[Strings.formFieldMethod]!
                      .invalidate(Strings.duplicateContact);
                  key.currentState!.fields[Strings.formFieldValue]!
                      .invalidate(Strings.duplicateContact);
                } else {
                  person.addContact(
                    "",
                    fields[Strings.formFieldMethod],
                    fields[Strings.formFieldValue],
                  );
                }
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
                name: Strings.formFieldMethod,
                initialValue: contact.method,
                validator: FormBuilderValidators.required(),
                values: ContactMethod.values,
              ),
              FormBuilderTextField(
                name: Strings.formFieldValue,
                initialValue: contact.value,
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
