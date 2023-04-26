import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/navigation_service_provider.dart';
import 'package:friend_list/presentation/anniversary_detail_page/anniversary_detail_page.dart';
import 'package:friend_list/presentation/anniversary_edit_page/anniversary_edit_page.dart';
import 'package:friend_list/presentation/contact_edit_page/contact_edit_page.dart';
import 'package:friend_list/presentation/person_list_page/person_list_page.dart';
import 'package:friend_list/presentation/person_detail_page/person_detail_page.dart';
import 'package:friend_list/presentation/person_edit_page/person_edit_page.dart';
import 'package:friend_list/presentation/tag_edit_page/tag_edit_page.dart';
import 'package:friend_list/presentation/tag_select_page/tag_select_page.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "FriendList",
      theme: ThemeData.light(),
      navigatorKey: ref.read(navigationServiceProvider).key,
      routes: {
        "/": (context) => const PersonListPage(),
        "/edit": (context) => const PersonEditPage(),
        "/detail": (context) => const PersonDetailPage(),
        "/anniversary/detail":(context) => const AnniversaryDetailPage(),
        "/anniversary/edit":(context) => const AnniversaryEditPage(),
        "/contact/edit":(context) => const ContactEditPage(),
        "/tag/select":(context) => const TagSelectPage(),
        "/tag/edit":(context) => const TagEditPage(),
      },
      initialRoute: "/",
    );
  }
}
