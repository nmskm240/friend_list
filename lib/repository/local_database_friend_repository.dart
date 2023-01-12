import 'package:flutter/widgets.dart';
import 'package:friend_list/infrastructure/database/app_database.dart';
import 'package:friend_list/infrastructure/database/friend_database.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository.dart';

class LocalDatabaseFriendRepository implements FreindRepository {
  @protected
  final AppDatabase<Friend> database;

  LocalDatabaseFriendRepository() : database = FriendDatabase();

  @override
  Future<void> deleteByID(int id) async {
    await database.deleteByID(id);
  }

  @override
  Future<Friend> findByID(int id) {
    return database.getByID(id);
  }

  @override
  Future<Iterable<Friend>> getAll() {
    return database.getAll();
  }

  @override
  Future<Friend> save(Friend friend) async {
    late final int id;
    if (friend.createdAt == null) {
      id = await database.insert(friend);
    } else {
      id = await database.update(friend);
    }
    return findByID(id);
  }
}
