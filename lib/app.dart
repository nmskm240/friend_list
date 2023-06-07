import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/app_router.dart' as app_router;

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(app_router.router);
    return MaterialApp.router(
      routerConfig: router.config(),
      title: Strings.appTitle,
      theme: ThemeData.light(),
    );
  }
}
