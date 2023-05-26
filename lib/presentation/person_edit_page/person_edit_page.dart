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
            ListViewWithHeader(
              leading: const Text(Strings.personEditPageFormAnniversaryLabel),
              action: IconButton(
                onPressed: () {
                  notifier.onPressedAddAnniversary();
                },
                icon: const Icon(Icons.add),
              ),
              body: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.anniversaries.length,
                itemBuilder: ((context, index) {
                  final anniversary = state.anniversaries.elementAt(index);
                  //NOTE: ドメインの修正をした方がよさそう
                  if (anniversary == null) {
                    return FormBuilderTextField(
                      name: Strings.birthdate,
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: const InputDecoration(
                        label: Text(Strings.birthdate),
                      ),
                      onTap: () {
                        notifier.onPressedAddAnniversary(name: Strings.birthdate);
                      },
                    );
                  } else {
                    return FormBuilderTextField(
                      name: anniversary.name,
                      focusNode: AlwaysDisabledFocusNode(),
                      decoration: InputDecoration(
                        label: Text(anniversary.name),
                        suffixIcon: !anniversary.isBirthdate
                            ? IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => notifier
                                    .onPressedDeletAnniversary(anniversary),
                              )
                            : null,
                      ),
                      initialValue: DateFormat.yMd().format(anniversary.date),
                      onTap: () =>
                          notifier.onPressedEditAnniversary(anniversary),
                    );
                  }
                }),
              ),
            ),
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
                  return FormBuilderTextField(
                    name: contact.name,
                    focusNode: AlwaysDisabledFocusNode(),
                    decoration: InputDecoration(
                      label: Text(contact.name),
                      prefixIcon: Icon(contact.method.icon),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () =>
                            notifier.onPressedDeletContact(contact),
                      ),
                    ),
                    initialValue: contact.value,
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
