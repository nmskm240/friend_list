import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';
import 'package:friend_list/presentation/common/provider/app_database_provider.dart';

final personRepositoryProvider =
    Provider((ref) => PersonRepository(ref.watch(appDatabaseProvider)));
