import 'package:friend_list/entity/friend.dart';

abstract class FreindRepository {
  Future<Friend> save(Friend friend);
  Future<Friend> findByID(int id);
  Future<void> deleteByID(int id);
  Future<Iterable<Friend>> getAll();
}