import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/provider/friend_basic_info_provider.dart';
import 'package:friend_list/view/component/friend_basic_info_form.dart';
import 'package:friend_list/view/component/registered_anniversary_list_view.dart';
import 'package:friend_list/view/component/registered_contact_list_view.dart';

class FriendEditPage extends StatelessWidget {
  final _basicInfo = GlobalKey<FormBuilderState>();
  final _anniversaries = GlobalKey<FormBuilderState>();
  final _contacts = GlobalKey<FormBuilderState>();

  FriendEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: () async {
                  //TODO: edit process
                  final isValidatedBasicInfo =
                      _basicInfo.currentState!.validate();
                  final isValidatedAnniversaries =
                      _anniversaries.currentState!.validate();
                  final isValidatedContacts =
                      _contacts.currentState!.validate();
                  if (isValidatedBasicInfo &&
                      isValidatedAnniversaries &&
                      isValidatedContacts) {
                    _basicInfo.currentState!.save();
                    _anniversaries.currentState!.save();
                    _contacts.currentState!.save();
                    print(ref.watch(friendBasicInfoProvider.notifier).name);
                    ref.watch(appRouteProvider.notifier).state =
                        "/friend/detail";
                  }
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          FriendBasicInfoForm(formKey: _basicInfo),
          const Divider(),
          RegisteredAnniversaryListView(formKey: _anniversaries),
          const Divider(),
          RegisteredContactListView(formKey: _contacts),
          const Divider(),
          //TODO: componentization
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
    );
  }
}
