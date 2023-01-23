import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/search_bar.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/view/component/friend_list_view.dart';

class FriendListPage extends ConsumerWidget {
  const FriendListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(appRouteProvider.notifier).state = "/friend/edit";
            },
          )
        ],
      ),
      body: Column(
        children: const [
          SearchBar(),
          FriendListView(),
        ],
      ),
    );
  }
}
