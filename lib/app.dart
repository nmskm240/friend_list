import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/page/anniversary_detail_page.dart';
import 'package:friend_list/presentation/page/anniversary_edit_page.dart';
import 'package:friend_list/presentation/page/contact_edit_page.dart';
import 'package:friend_list/presentation/page/home_page.dart';
import 'package:friend_list/presentation/page/person_info_detail_page.dart';
import 'package:friend_list/presentation/page/person_info_edit_page.dart';
import 'package:friend_list/presentation/page/tag_select_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "FriendList",
      theme: ThemeData.light(),
      routes: {
        "/": (context) => const HomePage(),
        "/edit": (context) => const PersonInfoEditPage(),
        "/detail": (context) => const PersonInfoDetailPage(),
        "/anniversary/detail":(context) => const AnniversaryDetailPage(),
        "/anniversary/edit":(context) => const AnniversaryEditPage(),
        "/contact/edit":(context) => const ContactEditPage(),
        "/tag/select":(context) => const TagSelectPage(),
      },
      initialRoute: "/",
    );
  }
}
