import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/router/app_router.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "FriendList",
      home: Router(
        routerDelegate: AppRouter(ref),
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF495464),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Color(0xFF495464),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F4F2),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF495464),
        ),
        bottomAppBarColor: const Color(0xFFE8E8E8),
        cardColor: const Color(0xFFE8E8E8),
      ),
    );
  }
}
