import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/contact_edit_page/notifier/contact_edit_page_notifier.dart';
import 'package:friend_list/presentation/contact_edit_page/provider/contact_edit_page_provider.dart';
import 'package:friend_list/presentation/contact_edit_page/provider/contact_edit_page_provider_parameter.dart';
import 'package:friend_list/presentation/contact_edit_page/state/contact_edit_page_state.dart';
import 'package:friend_list/presentation/contact_edit_page/widgets/form_bulder_modal_bottom_sheet.dart';

@RoutePage<Contact>()
class ContactEditPage extends ConsumerWidget {
  @protected
  final AutoDisposeStateNotifierProvider<ContactEditPageNotifier,
      ContactEditPageState> provider;

  ContactEditPage({
    super.key,
    required Person person,
    required Contact contact,
  }) : provider = contactEditPageProvider(
          ContactEditPageProviderParameter(
            person: person,
            contact: contact,
          ),
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              await notifier.onPressedSave();
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: state.formKey,
        initialValue: state.initialValue,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: state.formFieldName,
                decoration: const InputDecoration(
                  label: Text(Strings.contactEditPageFormNameLabel),
                ),
              ),
              FormBuilderModalBottomSheet<ContactMethod>(
                name: state.formFieldMethod,
                label: const Text(Strings.contactEditPageFormMethodLabel),
                validator: FormBuilderValidators.required(),
                // unknownを表示させないためskip
                values: ContactMethod.values.skip(1),
              ),
              FormBuilderTextField(
                name: state.formFieldValue,
                decoration: const InputDecoration(
                  label: Text(Strings.contactEditPageFormValueLabel),
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
