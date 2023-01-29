import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/search_bar.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/view/component/person_list_view.dart';

class PersonListPage extends ConsumerWidget {
  const PersonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Persons"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(appRouteProvider.notifier).state = "/person/edit";
            },
          )
        ],
      ),
      body: Column(
        children: const [
          SearchBar(),
          PersonListView(),
        ],
      ),
    );
  }
}
