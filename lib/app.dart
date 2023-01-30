import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/page/home_page.dart';
import 'package:friend_list/presentation/page/person_info_edit_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "FriendList",
      routes: {
        "/": (context) => const HomePage(),
        "/edit": (context) => const PersonInfoEditPage(),
      },
      initialRoute: "/",
    );
  }
}
