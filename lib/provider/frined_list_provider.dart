import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository_by_local_database.dart';
import 'package:friend_list/view_model/friend_list_view_model.dart';

final friendListProvider =
    StateNotifierProvider<FriendListViewModel, AsyncValue<List<Friend>>>(
  (ref) {
    return FriendListViewModel(FriendRepositoryByLocalDatbase());
  },
);