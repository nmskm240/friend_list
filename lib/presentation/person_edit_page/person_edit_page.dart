import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/common/always_disabled_focus_node.dart';
import 'package:friend_list/presentation/common/widget/list_view_with_header.dart';
import 'package:friend_list/presentation/person_edit_page/provider/person_edit_page_provider.dart';
import 'package:friend_list/presentation/person_edit_page/widget/form_builder_circle_avatar.dart';
import 'package:intl/intl.dart';

@RoutePage()
class PersonEditPage extends ConsumerWidget {
  final Person? domain;

  const PersonEditPage({super.key, this.domain});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = personEditPageProvider(domain);
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    final key = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          IconButton(
            onPressed: () => notifier.onPressedSave(key),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: FormBuilder(
        key: key,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            ListViewWithHeader(
              title: FormBuilderCircleAvatar(
                name: "icon",
                initalValue: state.person.icon,
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'name',
                    initialValue: state.person.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                      label: Text("name"),
                    ),
                    onChanged: notifier.onChangedName,
                  ),
                  FormBuilderTextField(
                    name: "nickname",
                    initialValue: state.person.nickname,
                    decoration: const InputDecoration(
                      label: Text("nickname"),
                    ),
                    onChanged: notifier.onChangedNickname,
                  ),
                ],
              ),
            ),
            const Divider(),
            ListViewWithHeader(
              leading: const Text("Anniversary"),
              action: IconButton(
                onPressed: notifier.onPressedAddAnniversary,
                icon: const Icon(Icons.add),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.anniversaryEditSettings.length,
                itemBuilder: ((context, index) {
                  final setting =
                      state.anniversaryEditSettings.elementAt(index);
                  return FormBuilderTextField(
                    name: setting.name,
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                      label: Text(setting.name),
                      suffixIcon: setting.canDelete
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  notifier.onPressedDeletAnniversary(setting),
                            )
                          : null,
                    ),
                    initialValue: setting.date == null
                        ? null
                        : DateFormat.yMd().format(setting.date!),
                    onTap: () => notifier.onPressedEditAnniversary(setting),
                  );
                }),
              ),
            ),
            const Divider(),
            ListViewWithHeader(
              leading: const Text("Contact"),
              action: IconButton(
                onPressed: notifier.onPressedAddContact,
                icon: const Icon(Icons.add),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.contactEditSettings.length,
                itemBuilder: ((context, index) {
                  final setting = state.contactEditSettings.elementAt(index);
                  return FormBuilderTextField(
                    name: setting.name,
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                      label: Text(setting.name),
                      prefixIcon: Icon(setting.method.icon),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            notifier.onPressedDeletContact(setting),
                      ),
                    ),
                    initialValue: setting.value,
                    onTap: () => notifier.onPressedEditContact(setting),
                  );
                }),
              ),
            ),
            const Divider(),
            ListViewWithHeader(
              leading: const Text("Tag"),
              action: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/tag/select");
                },
                icon: const Icon(Icons.add),
              ),
              body: Wrap(
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
            ),
          ],
        ),
      ),
    );
  }
}
