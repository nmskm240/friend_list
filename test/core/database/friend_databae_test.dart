import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/core/database/friend_database.dart';
import 'package:friend_list/model/anniversary.dart';
import 'package:friend_list/model/contact.dart';
import 'package:friend_list/model/friend.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class FriendDatabaseMock extends FriendDatabase {
  FriendDatabaseMock._();

  static FriendDatabaseMock get instance => FriendDatabaseMock._();

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
  test("open database", () async {
    final database = await FriendDatabaseMock.instance.database;
    expect(await database.getVersion(), 1);
    print(database.path);
  });

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
        )
      ],
      contacts: [
        const Contact(
          method: ContactMethodType.address,
          value: "test@test.test",
        ),
      ],
    );
    expect(() => (FriendDatabaseMock.instance.insert(friend)), returnsNormally);
  });

  test("get all", () async {
    final friends = await FriendDatabaseMock.instance.getAll();
    expect(friends.length, isPositive);
  });

  test("get at", () async {
    final friend = await FriendDatabaseMock.instance.getAt(1);
    expect(friend.name, "Test Friend");
    expect(friend.anniversaries?.length, 1);
  });
}
