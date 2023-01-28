import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/form_builder__circle_avatar.dart';
import 'package:friend_list/provider/friend_basic_info_provider.dart';

class FriendBasicInfoForm extends ConsumerWidget {
  final GlobalKey formKey;

  const FriendBasicInfoForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(friendBasicInfoProvider.notifier);
    return FormBuilder(
      key: formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: FormBuilderCircleAvatar(
              name: "icon",
              radius: 60,
              initialIcon: ref.watch(friendBasicInfoProvider
                  .select((value) => value.icon)),
              onSaved: (s) {
                viewmodel.icon = s;
              },
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: FormBuilderTextField(
                  name: 'name',
                  initialValue: viewmodel.name,
                  onSaved: (value) {
                    viewmodel.name = value;
                  },
                  decoration: const InputDecoration(
                    label: Text("name"),
                  ),
                  validator: viewmodel.nameValidator,
                ),
              ),
              ListTile(
                title: FormBuilderTextField(
                  name: "nickname",
                  initialValue: viewmodel.nickname,
                  onSaved: (value) {
                    viewmodel.nickname = value;
                  },
                  decoration: const InputDecoration(
                    label: Text("nickname"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
