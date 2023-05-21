import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/app_router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _router = ref.watch(router);
    return MaterialApp.router(
      routerConfig: _router.config(),
      title: Strings.appTitle,
      theme: ThemeData.light(),
    );
  }
}
