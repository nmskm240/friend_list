import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/app_lifecycle_service.dart';
import 'package:friend_list/application/usecase/reset_notification_schedule_usecase.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/app_router.dart' as app_router;

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  Future<void> onAppInactive(WidgetRef ref) async {
    await ref.read(resetNotificationSchedule).call();
  }

  Future<void> onChangedAppLifecycleState(WidgetRef ref,
      AppLifecycleState? previous, AppLifecycleState next) async {
    switch (next) {
      case AppLifecycleState.inactive:
        await onAppInactive(ref);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(app_router.router);
    ref.listen<AppLifecycleState>(appLifecycleProvider,
        ((previous, next) => onChangedAppLifecycleState(ref, previous, next)));
    return MaterialApp.router(
      routerConfig: router.config(),
      title: Strings.appTitle,
      theme: ThemeData.light(),
    );
  }
}
