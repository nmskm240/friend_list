import 'dart:async';
import 'dart:io';

import 'package:friend_list/common/exception/unknown_platform.dart';
import 'package:friend_list/data_source/database_wrapper.dart';
import 'package:friend_list/data_source/tables/anniversary_table.dart';
import 'package:friend_list/data_source/tables/contact_table.dart';
import 'package:friend_list/data_source/tables/notification_table.dart';
import 'package:friend_list/data_source/tables/person_table.dart';
import 'package:friend_list/data_source/tables/registered_tag_table.dart';
import 'package:friend_list/data_source/tables/tag_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase extends DatabaseWrapper {
  AppDatabase()
      : super(
          tables: [
            AnniversaryTable(),
            ContactTable(),
            NotificationTable(),
            PersonTable(),
            RegisteredTagTable(),
            TagTable(),
          ],
        );

  @override
  Future<String> getPath() async {
    late final String path;
    if (Platform.isAndroid) {
      path = await getDatabasesPath();
    } else if (Platform.isIOS) {
      final directory = await getLibraryDirectory();
      path = directory.path;
    } else {
      throw const UnknownPlatformException();
    }
    return join(path, fileName);
  }

  @override
  Future<Database> openDatabaseProcess(String path) async {
    return await openDatabase(
      path,
      version: 1,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = true');
      },
      onCreate: (db, version) async {
        for (final table in tables) {
          await table.onCreate(db, version);
        }
      },
    );
  }
}
