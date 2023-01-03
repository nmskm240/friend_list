import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/friend_list_tile.dart';
import 'package:friend_list/component/search_bar.dart';
import 'package:friend_list/core/database/friend_database.dart';
import 'package:friend_list/model/friend.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/provider/friend_select_provider.dart';

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
              ref.read(appRouteProvider.notifier).state = "/friend/edit";
            },
          )
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: FutureBuilder(
              future: FriendDatabase.instance.getAll(),
              builder: (BuildContext context,
                  AsyncSnapshot<Iterable<Friend>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (snapshot.hasError) {
                  //TODO: error handling
                  return const Center(
                    child: Text("ERROR"),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = snapshot.data!.elementAt(index);
                    return FriendListTile(
                      data: data,
                      onTap: () {
                        ref.read(friendSelectProvider.notifier).state =
                            data.id!;
                        ref.read(appRouteProvider.notifier).state =
                            "/friend/detail";
                      },
                    );
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
