import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository.dart';
import 'package:friend_list/repository/friend_repository_by_local_database.dart';

final friendListViewModelProvider =
    StateNotifierProvider<FriendListViewModel, AsyncValue<List<Friend>>>(
  (ref) {
    return FriendListViewModel(FriendRepositoryByLocalDatbase());
  },
);

class FriendListViewModel extends StateNotifier<AsyncValue<List<Friend>>> {
  final FriendRepository _repository;

  FriendListViewModel(this._repository) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final friends = await _repository.getAll();
      return friends.toList();
    });
  }
}
