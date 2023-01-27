import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/form_builder__circle_avatar.dart';
import 'package:friend_list/view_model/friend_basic_info_edit_view_model.dart';

class FriendBasicInfoForm extends ConsumerWidget {
  late final GlobalKey formKey;

  FriendBasicInfoForm({super.key}) {
    formKey = GlobalKey<FormBuilderState>();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(friendBasicInfoViewModelProvider.notifier);
    return FormBuilder(
      key: formKey,
      child: Column(
        children: <Widget>[
          Center(
            child: FormBuilderCircleAvatar(
              name: "icon",
              radius: 60,
              initialIcon: ref.watch(friendBasicInfoViewModelProvider
                  .select((value) => value.icon)),
              onChanged: (s) {
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
                  onSubmitted: (value) {
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
                  onSubmitted: (value) {
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
