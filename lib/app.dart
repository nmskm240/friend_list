import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/app_lifecycle_service.dart';
import 'package:friend_list/application/usecase/reset_notification_schedule_usecase.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/app_router.dart' as app_router;

class App extends ConsumerWidget {
  late final WidgetRef _ref;

  App({Key? key}) : super(key: key);

  Future<void> onAppInactive() async {
    await _ref.read(resetNotificationSchedule).call();
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
