import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/search_bar.dart';
import 'package:friend_list/provider/app_router_provider.dart';

class FriendList extends ConsumerWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref.read(appRouteProvider.notifier).state = "/edit";
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: const Text("Test Friend"),
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  onTap: () {
                    ref.read(appRouteProvider.notifier).state = "/detail";
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
