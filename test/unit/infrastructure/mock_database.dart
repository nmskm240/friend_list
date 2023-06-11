import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/data_source/database_wrapper.dart';
import 'package:friend_list/data_source/tables/anniversary_table.dart';
import 'package:friend_list/data_source/tables/contact_table.dart';
import 'package:friend_list/data_source/tables/notification_table.dart';
import 'package:friend_list/data_source/tables/person_table.dart';
import 'package:friend_list/data_source/tables/registered_tag_table.dart';
import 'package:friend_list/data_source/tables/tag_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockDatabae extends DatabaseWrapper {
  final bool enabledForeignKey;

  MockDatabae({this.enabledForeignKey = true})
      : super(
          tables: [
            AnniversaryTable(),
            ContactTable(),
            NotificationTable(),
            PersonTable(),
            RegisteredTagTable(),
            TagTable(),
          ],
          fileName: "test.db",
        );

  @override
  Future<String> getPath() async {
    return fileName;
  }

  @override
  Future<Database> openDatabaseProcess(String path) {
    sqfliteFfiInit();
    final databaseFactory = databaseFactoryFfi;
    return databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onConfigure: (db) async {
          if (enabledForeignKey) {
            await db.execute('PRAGMA foreign_keys = true');
          }
        },
        onCreate: (db, version) async {
          for (final table in tables) {
            await table.onCreate(db, version);
          }
        },
      ),
    );
  }
}
