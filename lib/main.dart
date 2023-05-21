import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/app.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';
import 'package:friend_list/presentation/common/provider/app_database_provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.loadOrDefault();
  runApp(ProviderScope(
    overrides: [
      personRepository.overrideWith(
        (ref) {
          final source = ref.watch(appDatabaseProvider);
          return PersonRepository(source);
        },
      ),
    ],
    child: const App(),
  ));
}
