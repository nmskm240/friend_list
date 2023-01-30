import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/provider/bottom_nvaigation_bar_router_provider.dart';
import 'package:friend_list/router/bottom_nvaigation_bar_router.dart';

class NavigatorBar extends ConsumerWidget {
  const NavigatorBar(WidgetRef ref, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Router(
        routerDelegate: BottomNavigationBarRouter(ref),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Person",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
            ),
            label: "Calender",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "Setting",
          ),
        ],
        currentIndex: ref.watch(bottomNavigationBarRouteProvider.notifier).state,
        onTap: (value) {
          ref.watch(bottomNavigationBarRouteProvider.notifier).state = value;
        },
      ),
    );
  }
}
