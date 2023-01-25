import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/component/form_builder__circle_avatar.dart';
import 'package:friend_list/view_model/friend_edit_view_model.dart';

class FriendEdit extends ConsumerWidget {
  const FriendEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final viewmodel = ref.watch(friendEditViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              //TODO: edit process
              await viewmodel.onSaved();
              ref.read(appRouteProvider.notifier).state = "/friend/detail";
            },
          ),
        ],
      ),
      body: FormBuilder(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(5),
          children: <Widget>[
            Center(
              child: FormBuilderCircleAvatar(
                name: "icon",
                radius: 60,
                initialIcon: viewmodel.icon,
                onChanged: (s) {
                  viewmodel.onChangedIcon(s ?? "");
                },
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  title: FormBuilderTextField(
                    name: 'name',
                    initialValue: viewmodel.name,
                    onChanged: (value) {
                      viewmodel.onChangedName(value ?? "");
                    },
                    decoration: const InputDecoration(
                      label: Text("name"),
                    ),
                  ),
                ),
                ListTile(
                  title: FormBuilderTextField(
                    name: "nickname",
                    initialValue: viewmodel.nickname,
                    onChanged: (value) {
                      viewmodel.onChangedNickname(value ?? "");
                    },
                    decoration: const InputDecoration(
                      label: Text("nickname"),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ListViewWithHeader.builder(
              context: context,
              title: "Anniversary",
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () async {
                  // TODO: add process
                  await viewmodel.createAnniversary(context);
                },
              ),
              itemCount: viewmodel.anniversaries.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTile(
                    title: FormBuilderDateTimePicker(
                      name: 'birthday',
                      initialValue: viewmodel.birthday,
                      inputType: InputType.date,
                      onChanged: (value) {
                        viewmodel.onChangedBirthday(value!);
                      },
                      decoration: const InputDecoration(
                        label: Text("Birthday"),
                      ),
                    ),
                  );
                } else {
                  final anniversary =
                      viewmodel.anniversaries.elementAt(index - 1);
                  return ListTile(
                    //TODO: Persistence of input values
                    title: FormBuilderDateTimePicker(
                      name: 'anniversaries.${anniversary.name}',
                      inputType: InputType.date,
                      decoration: InputDecoration(
                        label: Text(anniversary.name),
                      ),
                      initialValue: anniversary.date,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await viewmodel.deleteAnniversary(context, anniversary);
                      },
                    ),
                  );
                }
              },
            ),
            const Divider(),
            ListViewWithHeader.builder(
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
                  //TODO: Persistence of input values
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
            ),
            const Divider(),
            ListViewWithHeader(
              title: "Tag",
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  // TODO: add process
                },
              ),
              children: <Widget>[
                ListTile(
                  title: Wrap(
                    children: <Widget>[
                      Chip(
                        label: const Text("test"),
                        onDeleted: () {
                          // TODO: delete process
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
