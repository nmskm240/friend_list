import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/friend_list_tile.dart';
import 'package:friend_list/component/search_bar.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/view_model/friend_list_view_model.dart';

class FriendList extends ConsumerWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(friendListViewModelProvider.notifier);
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
            child: RefreshIndicator(
              onRefresh: viewmodel.load,
              child: ref.watch(friendListViewModelProvider).when(
                    loading: CircularProgressIndicator.new,
                    error: (error, stacktrace) => Text(error.toString()),
                    data: (value) {
                      return ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return FriendListTile(
                            data: value.elementAt(index),
                          );
                        },
                      );
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
