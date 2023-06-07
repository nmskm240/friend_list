import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/common/always_disabled_focus_node.dart';
import 'package:friend_list/presentation/common/widget/list_view_with_header.dart';
import 'package:friend_list/presentation/person_edit_page/notifier/person_edit_page_notifier.dart';
import 'package:friend_list/presentation/person_edit_page/provider/person_edit_page_provider.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';
import 'package:friend_list/presentation/person_edit_page/widget/form_builder_circle_avatar.dart';
import 'package:intl/intl.dart';

@RoutePage<Person>()
class PersonEditPage extends ConsumerWidget {
  final AutoDisposeStateNotifierProvider<PersonEditPageNotifier,
      PersonEditPageState> _provider;

  PersonEditPage({super.key, required Person person})
      : _provider = personEditPageProvider(person);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_provider);
    final notifier = ref.read(_provider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          IconButton(
            onPressed: () async {
              await notifier.onPressedSave();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: FormBuilder(
        key: state.formKey,
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: <Widget>[
            ListViewWithHeader(
              title: FormBuilderCircleAvatar(
                name: Strings.formFieldIcon,
                initalValue: state.person.icon,
                onChanged: (val) {
                  notifier.onChangedIcon(val);
                },
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  FormBuilderTextField(
                    name: Strings.formFieldName,
                    initialValue: state.person.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                      label: Text(Strings.personEditPageFormNameLabel),
                    ),
                    onChanged: (val) {
                      notifier.onChangedName(val);
                    },
                  ),
                  FormBuilderTextField(
                    name: Strings.formFieldNickname,
                    initialValue: state.person.nickname,
                    decoration: const InputDecoration(
                      label: Text(Strings.personEditPageFormNicknameLabel),
                    ),
                    onChanged: (val) {
                      notifier.onChangedNickname(val);
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            const Spacer(),
            const Divider(),
            ListViewWithHeader(
              leading: const Text(Strings.personEditPageFormAnniversaryLabel),
              action: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  notifier.onPressedAddAnniversary();
                },
              ),
              body: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.anniversaries.length,
                itemBuilder: ((context, index) {
                  final anniversary = state.anniversaries.elementAt(index);
                  if (anniversary == null) {
                    return ListTile(
                      title: const Text(Strings.birthdate),
                      minLeadingWidth: 0,
                      contentPadding: const EdgeInsets.only(left: 0, right: 0),
                      onTap: () {
                        notifier.onPressedAddAnniversary(
                          name: Strings.birthdate,
                        );
                      },
                    );
                  } else {
                    return ListTile(
                      title: Text(anniversary.name),
                      subtitle: Text(DateFormat.yMd().format(anniversary.date)),
                      contentPadding: const EdgeInsets.only(left: 0, right: 0),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          notifier.onPressedDeletAnniversary(anniversary);
                        },
                      ),
                      onTap: () {
                        notifier.onPressedEditAnniversary(anniversary);
                      },
                    );
                  }
                }),
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ),
            const Divider(),
            const Spacer(),
            const Divider(),
            ListViewWithHeader(
              leading: const Text(Strings.personEditPageFormContactLable),
              action: IconButton(
                onPressed: () => notifier.onPressedAddContact(),
                icon: const Icon(Icons.add),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.contacts.length,
                itemBuilder: ((context, index) {
                  final contact = state.contacts.elementAt(index);
                  return ListTile(
                    title: Text(contact.name.isEmpty
                        ? contact.method.name
                        : contact.name),
                    subtitle: Text(contact.value),
                    contentPadding: const EdgeInsets.only(left: 0, right: 0),
                    leading: Icon(contact.method.icon),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        notifier.onPressedDeletContact(contact);
                      },
                    ),
                    onTap: () {
                      notifier.onPressedEditContact(contact);
                    },
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
