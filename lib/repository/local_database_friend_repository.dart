import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/friend_database.dart';
import 'package:friend_list/model/friend.dart';
import 'package:friend_list/repository/friend_repository.dart';

class LocalDatabaseFriendRepository implements FreindRepository {
  @protected
  final FriendDatabase database;

  LocalDatabaseFriendRepository() : database = FriendDatabase();

  @override
  Future<void> deleteByID(int id) async {
    await database.deleteAt(id);
  }

  @override
  Future<Friend> findByID(int id) {
    return database.getAt(id);
  }

  @override
  Future<Iterable<Friend>> getAll() {
    return database.getAll();
  }

  @override
  Future<Friend> save(Friend friend) async {
    late final int id;
    if (friend.id == null) {
      id = await database.insert(friend);
    } else {
      id = await database.update(friend);
    }
    return findByID(id);
  }
}
