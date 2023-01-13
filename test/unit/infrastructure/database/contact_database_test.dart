import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/infrastructure/database/contact_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ContactDatabaseMock extends ContactDatabase {
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
    const contact = Contact(
      method: ContactMethodType.address,
      value: "test@abc.de",
      friendID: 1,
    );
    final database = ContactDatabaseMock();
    id = await database.insert(contact);
    expect(id, isPositive);
  });

  test("insert error", () async {
    const contact = Contact(
      method: ContactMethodType.email,
      value: "test@abc.de",
    );
    final database = ContactDatabaseMock();
    expect(() async => await database.insert(contact), throwsException);
  });

  test("get all", () async {
    final database = ContactDatabaseMock();
    final contacts = await database.getAll();
    expect(contacts.length, isPositive);
  });

  test("get at", () async {
    final database = ContactDatabaseMock();
    final contact = await database.getByID(id);
    expect(contact, isA<Contact>());
  });

  test("update", () async {
    final database = ContactDatabaseMock();
    final contact = await database.getByID(id);
    final edited = contact.copyWith(value: "Demo Contact");
    await database.update(edited);
    final check = await database.getByID(edited.id!);
    expect(check.value, equals("Demo Contact"));
    expect(check.id, equals(contact.id));
  });

  test("delete", () async {
    final database = ContactDatabaseMock();
    await database.deleteByID(id);
    expect(() async => await database.getByID(id), throwsException);
  });
}
