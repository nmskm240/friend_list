import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/person_app_service.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';
import 'package:friend_list/presentation/common/provider/app_database_provider.dart';

final personServiceProvider = Provider(
  (ref) {
    return PersonAppService(
      PersonFactory(),
      PersonRepository(ref.watch((appDatabaseProvider))),
    );
  },
);