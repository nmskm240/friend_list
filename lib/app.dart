import 'package:flutter/material.dart';
import 'package:friend_list/view/friend_detail.dart';
import 'package:friend_list/view/friend_edit.dart';
import 'package:friend_list/view/friends.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FriendList",
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      initialRoute: "/friends",
      routes: <String, WidgetBuilder>{
        "/friends": (BuildContext context) => const Friends(),
        "/friends/detail": (BuildContext context) => const FriendDetail(),
        "/friends/edit": (BuildContext context) => const FriendEdit(),
      },
    );
  }
}
