import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/infrastructure/database/anniversary_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AnniversaryDatabaseMock extends AnniversaryDatabase {
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
  int id = 1;
  test("insert", () async {
    final anniversary = Anniversary(
      name: "Test Anniversary",
      date: DateTime(2000, 1, 1),
      friendID: 1,
    );
    final database = AnniversaryDatabaseMock();
    id = await database.insert(anniversary);
    expect(id, isPositive);
  });

  test("insert error", () async {
    final anniversary = Anniversary(
      name: "Test Anniversary",
      date: DateTime(2000, 1, 1),
    );
    final database = AnniversaryDatabaseMock();
    expect(() async => await database.insert(anniversary), throwsException);
  });

  test("get all", () async {
    final database = AnniversaryDatabaseMock();
    final anniversaries = await database.getAll();
    expect(anniversaries.length, isPositive);
  });

  test("get at", () async {
    final database = AnniversaryDatabaseMock();
    final anniversary = await database.getByID(id);
    expect(anniversary, isA<Anniversary>());
    expect(anniversary.name, equals("Test Anniversary"));
  });

  test("update", () async {
    final database = AnniversaryDatabaseMock();
    final anniversary = await database.getByID(id);
    final edited = anniversary.copyWith(name: "Demo Anniversary");
    await database.update(edited);
    final check = await database.getByID(edited.id!);
    expect(check.name, equals("Demo Anniversary"));
    expect(check.id, equals(anniversary.id));
  });

  test("delete", () async {
    final database = AnniversaryDatabaseMock();
    await database.deleteByID(id);
    expect(() async => await database.getByID(id), throwsException);
  });
}
