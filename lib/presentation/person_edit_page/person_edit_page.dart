import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/presentation/common/always_disabled_focus_node.dart';
import 'package:friend_list/presentation/common/provider/default_icon_provider.dart';
import 'package:friend_list/presentation/common/provider/person_service_provider.dart';
import 'package:friend_list/presentation/common/widget/list_view_with_header.dart';
import 'package:friend_list/presentation/person_edit_page/widget/form_builder_circle_avatar.dart';

class PersonEditPage extends ConsumerWidget {
  const PersonEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultIcon = ref.watch(defaultIconProvider);
    final service = ref.read(personServiceProvider);
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          IconButton(
            onPressed: () async {
              if (key.currentState!.validate()) {
                final fields = key.currentState!.instantValue;
                await service.createAndSavePerson(
                  fields["name"],
                  fields["nickname"],
                  fields["icon"],
                  [],
                  [],
                );
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: defaultIcon.when(
        error: (error, stackTrace) {
          return const Center(
            child: Text("Cloud not load data"),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        data: (data) {
          return FormBuilder(
            key: key,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: <Widget>[
                ListViewWithHeader(
                  scrollLock: true,
                  title: FormBuilderCircleAvatar(
                    name: "icon",
                    initalValue: data,
                  ),
                  children: <Widget>[
                    FormBuilderTextField(
                      name: 'name',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                      decoration: const InputDecoration(
                        label: Text("name"),
                      ),
                    ),
                    FormBuilderTextField(
                      name: "nickname",
                      initialValue: "",
                      decoration: const InputDecoration(
                        label: Text("nickname"),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                ListViewWithHeader(
                  scrollLock: true,
                  leading: const Text("Anniversary"),
                  action: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/anniversary/edit");
                    },
                    icon: const Icon(Icons.add),
                  ),
                  children: <Widget>[
                    FormBuilderTextField(
                      name: "birthdate",
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: const InputDecoration(
                        label: Text("birthdate"),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed("/anniversary/edit");
                      },
                    ),
                  ],
                ),
                const Divider(),
                ListViewWithHeader(
                  scrollLock: true,
                  leading: const Text("Contact"),
                  action: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/contact/edit");
                    },
                    icon: const Icon(Icons.add),
                  ),
                  children: <Widget>[],
                ),
                const Divider(),
                ListViewWithHeader(
                  scrollLock: true,
                  leading: const Text("Tag"),
                  action: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/tag/select");
                    },
                    icon: const Icon(Icons.add),
                  ),
                  children: <Widget>[
                    Wrap(
                      spacing: 5,
                      children: <InputChip>[
                        InputChip(
                          label: const Text("test"),
                          onDeleted: () {
                            //TODO: remove tag
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
