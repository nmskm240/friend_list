import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/data_source/app_database.dart';
import 'package:friend_list/data_source/database_wrapper.dart';

final appDatabaseProvider = Provider<DatabaseWrapper>((ref) => AppDatabase());
