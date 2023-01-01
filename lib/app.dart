import 'package:flutter/material.dart';
import 'package:friend_list/view/friend_detail.dart';
import 'package:friend_list/view/friend_edit.dart';
import 'package:friend_list/view/friend_list.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendList",
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
      initialRoute: "/friends",
      routes: <String, WidgetBuilder>{
        "/friends": (BuildContext context) => const FriendList(),
        "/friends/detail": (BuildContext context) => const FriendDetail(),
        "/friends/edit": (BuildContext context) => const FriendEdit(),
      },
    );
  }
}
