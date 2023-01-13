import 'package:friend_list/entity/friend.dart';

abstract class FriendRepository {
  Future<Friend> save(Friend friend);
  Future<Friend> findByID(int id);
  Future<void> deleteByID(int id);
  Future<Iterable<Friend>> getAll();
}