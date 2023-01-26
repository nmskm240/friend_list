import 'package:friend_list/infrastructure/local/anniversary_table.dart';
import 'package:friend_list/infrastructure/local/contact_table.dart';
import 'package:friend_list/infrastructure/local/friend_table.dart';
import 'package:friend_list/infrastructure/local/i_database_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MockDatabase implements IDatabaseProvider {
  Database? _database;
  final tables = const [
    FriendTable(),
    AnniversaryTable(),
    ContactTable(),
  ];

  @override
  Future<Database> get database async => _database ??= await init();

  @override
  Future<Database> init() async {
    sqfliteFfiInit();
    final options = OpenDatabaseOptions(
      version: 1,
      onCreate: (db, version) => onCreate(db, version),
    );
    return await databaseFactoryFfi.openDatabase("test.db", options: options);
  }

  @override
  void onCreate(Database db, int version) {
    for (final table in tables) {
      table.onCreate(db, version);
    }
  }
}
