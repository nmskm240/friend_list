import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/registered_contact_list_view_model_provider.dart';

class RegisteredContactListView extends ConsumerWidget {
  const RegisteredContactListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(registeredContactListProvider);
    return ListViewWithHeader.builder(
      context: context,
      title: "Contact",
      trailing: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () async {
          // TODO: add process
          await viewmodel.createContact(context);
        },
      ),
      itemCount: viewmodel.contacts.length,
      itemBuilder: (context, index) {
        final contact = viewmodel.contacts.elementAt(index);
        return ListTile(
          title: FormBuilderTextField(
            name: 'contacts.${contact.method.name}',
            decoration: InputDecoration(
              label: Text(contact.method.name),
            ),
            initialValue: contact.value,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              await viewmodel.deleteContact(context, contact);
            },
          ),
        );
      },
    );
  }
}
