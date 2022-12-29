import 'package:flutter/material.dart';
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
      },
    );
  }
}
