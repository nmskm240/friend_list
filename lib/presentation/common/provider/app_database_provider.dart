import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/data_source/app_database.dart';

final appDatabaseProvider = Provider((ref) => AppDatabase());
