import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/app.dart';
import 'package:friend_list/infrastructure/local_database/person/person_repository.dart';
import 'package:friend_list/infrastructure/local_notification/i_notification_scheduler.dart';
import 'package:friend_list/infrastructure/local_notification/local_notification_scheduler.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/presentation/common/provider/app_database_provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  final scheduler = LocalNotificationScheduler();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await scheduler.init();
  await SharedPreferencesHelper.loadOrDefault();
  runApp(ProviderScope(
    overrides: [
      personRepository.overrideWith(
        (ref) {
          final source = ref.watch(appDatabaseProvider);
          return PersonRepository(source);
        },
      ),
      notificationScheduler.overrideWithValue(scheduler),
    ],
    child: App(),
  ));
}
