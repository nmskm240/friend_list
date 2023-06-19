import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/app_lifecycle_service.dart';
import 'package:friend_list/application/local_notification_service.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/presentation/app_router.dart' as app_router;

class App extends ConsumerWidget {
  late final WidgetRef _ref;

  App({Key? key}) : super(key: key);

  Future<void> onAppInactive() async {
    final service = _ref.read(localNotificationServiceProvider);
    final repository = _ref.read(personRepository);
    await service.cnacelAllScheduled();
    final map = await repository.getSortedRemindMap();
    // FIXME: iOS展開する場合はスケジュール上限を考慮する必要がある
    for (final entry in map.entries) {
      final index = map.entries.toList().indexOf(entry);
      //TODO: 通知タイトルは動的に変えられたほうがいいかも
      await service.setSchedule(
        index,
        "記念日通知",
        entry.value.name,
        entry.value.date.month,
        entry.value.date.day,
      );
    }
  }

  Future<void> onChangedAppLifecycleState(
      AppLifecycleState? previous, AppLifecycleState next) async {
    switch (next) {
      case AppLifecycleState.inactive:
        await onAppInactive();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    final router = ref.watch(app_router.router);
    ref.listen<AppLifecycleState>(
        appLifecycleProvider, onChangedAppLifecycleState);
    return MaterialApp.router(
      routerConfig: router.config(),
      title: Strings.appTitle,
      theme: ThemeData.light(),
    );
  }
}
