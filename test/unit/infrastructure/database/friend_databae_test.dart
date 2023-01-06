import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/infrastructure/database/friend_database.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';
import 'package:friend_list/model/friend.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FriendDatabaseMock extends FriendDatabase {
  @override
  Future<Database> init() async {
    sqfliteFfiInit();
    final path = await tryGetPath();
    final options = OpenDatabaseOptions(
      version: 1,
      onCreate: super.onCreate,
    );
    return await databaseFactoryFfi.openDatabase(path, options: options);
  }

  @override
  Future<String> tryGetPath() async {
    return "test.db";
  }
}

void main() {
  int id = 1;
  test("insert", () async {
    final friend = Friend(
      name: "Test Friend",
      nickname: "Test01",
      icon: "icon_image",
      birthday: DateTime.now(),
      anniversaries: [
        Anniversary(
          name: "Test Anniversary",
          date: DateTime.now(),
        ),
      ],
      contacts: [
        const Contact(
          method: ContactMethodType.address,
          value: "test@test.test",
        ),
      ],
    );
    final database = FriendDatabaseMock();
    id = await database.insert(friend);
    expect(id, isPositive);
    print(id);
  });

  test("get all", () async {
    final database = FriendDatabaseMock();
    final friends = await database.getAll();
    expect(friends.length, isPositive);
  });

  test("get at", () async {
    final database = FriendDatabaseMock();
    final friend = await database.getAt(id);
    expect(friend.name, "Test Friend");
    expect(friend.anniversaries?.length, 1);
  });

  test("update", () async {
    final database = FriendDatabaseMock();
    final friend = await database.getAt(id);
    final anniversary = friend.anniversaries?.first;
    final edited = Friend(
      id: friend.id,
      name: "Demo Friend",
      nickname: friend.nickname,
      anniversaries: [
        Anniversary(id: anniversary!.id, name: "Demo", date: anniversary.date),
        Anniversary(name: "Demo 2", date: DateTime.now())
      ],
      contacts: [],
    );
    await database.update(edited);
    final check = await database.getAt(edited.id!);
    expect(check.name, "Demo Friend");
    expect(check.anniversaries?.length, 2);
    expect(check.contacts?.length, 0);
    print(check);
  });

  test("delete", () async {
    final database = FriendDatabaseMock();
    await database.deleteAt(id);
    expect(() async => await database.getAt(id), throwsException);
  });
}
