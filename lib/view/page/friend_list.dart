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
    final viewModel =
        ref.watch<FriendListViewModel>(friendListViewModelProvider);
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
              onRefresh: viewModel.refresh,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: viewModel.friends.length,
                itemBuilder: (context, index) {
                  return FriendListTile(
                    data: viewModel.friends.elementAt(index),
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
