import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/component/form_builder__circle_avatar.dart';

class FriendEdit extends ConsumerWidget {
  const FriendEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //TODO: edit process
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
              ),
            ),
            Card(
              child: ListViewWithHeader(
                title: "Profile",
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("name"),
                      ),
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("nickname"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ListViewWithHeader(
                title: "Anniversary",
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // TODO: add process
                  },
                ),
                children: <Widget>[
                  ListTile(
                    title: FormBuilderDateTimePicker(
                      name: 'anniversaries.birthday',
                      inputType: InputType.date,
                      decoration: const InputDecoration(
                        label: Text("Birthday"),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: delete process
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ListViewWithHeader(
                title: "Contact",
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // TODO: add process
                  },
                ),
                children: <Widget>[
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Phone"),
                      ),
                      controller: TextEditingController(
                        text: "000-0000-0000",
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: delete process
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Address"),
                      ),
                      controller: TextEditingController(
                        text: "XXXXX XXXXXXX",
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: delete process
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Twitter"),
                      ),
                      controller: TextEditingController(
                        text: "@XXXX",
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // TODO: delete process
                      },
                    ),
                  ),
                ],
              ),
            ),
            Card(
              child: ListViewWithHeader(
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
            ),
          ],
        ),
      ),
    );
  }
}
