import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/registered_contact_list_view_model_provider.dart';

class RegisteredContactListView extends ConsumerWidget {
  final GlobalKey formKey;

  const RegisteredContactListView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(registeredContactListProvider);
    return FormBuilder(
      key: formKey,
      child: ListViewWithHeader.builder(
        context: context,
        title: "Contact",
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            await viewmodel.createContact(context);
          },
        ),
        itemCount: viewmodel.contacts.length,
        itemBuilder: (context, index) {
          final contact = viewmodel.contacts.elementAt(index);
          return ListTile(
            title: FormBuilderTextField(
              name: contact.method.name,
              decoration: InputDecoration(
                label: Text(contact.method.name),
              ),
              initialValue: contact.value,
              validator: (value) {
                print(value);
                return viewmodel
                    .contactValidate(contact.copyWith(value: value ?? ""));
              },
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await viewmodel.deleteContact(context, contact);
              },
            ),
          );
        },
      ),
    );
  }
}
