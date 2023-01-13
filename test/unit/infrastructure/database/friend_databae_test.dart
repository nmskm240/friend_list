import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/infrastructure/database/friend_database.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FriendDatabaseMock extends FriendDatabase {
  @override
  Future<Database> init() async {
    sqfliteFfiInit();
    final path = super.fileName;
    final options = OpenDatabaseOptions(
      version: 1,
      onCreate: super.table.onCreate,
    );
    return await databaseFactoryFfi.openDatabase(path, options: options);
  }
}

void main() {
  int id = 14;
  test("insert", () async {
    final friend = Friend(
      name: "Test Friend",
      nickname: "Test01",
      icon: "icon_image",
      birthday: DateTime.now(),
    );
    final database = FriendDatabaseMock();
    id = await database.insert(friend);
    expect(id, isPositive);
  });

  test("get all", () async {
    final database = FriendDatabaseMock();
    final friends = await database.getAll();
    expect(friends.length, isPositive);
  });

  test("get at", () async {
    final database = FriendDatabaseMock();
    final friend = await database.getByID(id);
    expect(friend.name, equals("Test Friend"));
  });

  test("update", () async {
    final database = FriendDatabaseMock();
    final friend = await database.getByID(id);
    final edited = friend.copyWith(name: "Demo Friend");
    await database.update(edited);
    final check = await database.getByID(edited.id!);
    expect(check.name, equals("Demo Friend"));
  });

  test("delete", () async {
    final database = FriendDatabaseMock();
    await database.deleteByID(id);
    expect(() async => await database.getByID(id), throwsException);
  });
}
