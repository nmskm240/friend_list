import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/friend_list_tile.dart';
import 'package:friend_list/model/friend.dart';
import 'package:friend_list/repository/friend_repository.dart';
import 'package:friend_list/repository/local_database_friend_repository.dart';

final friendListViewModelProvider =
    ChangeNotifierProvider((ref) => FriendListViewModel());

class FriendListViewModel extends ChangeNotifier {
  List<Friend> _friends = [];
  final FreindRepository _repository;

  Iterable<Friend> get friends => _friends;

  FriendListViewModel({FreindRepository? repository})
      : _repository = repository ?? LocalDatabaseFriendRepository();

  Future<void> refresh() async {
    final values = await _repository.getAll();
    _friends = List<Friend>.from(values);
    notifyListeners();
  }

  Widget buildListTile(BuildContext context, int index) {
    final friend = _friends.elementAt(index);
    return FriendListTile(data: friend);
  }
}
