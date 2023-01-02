import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/provider/bottom_nvaigation_bar_router_provider.dart';
import 'package:friend_list/view/calender.dart';
import 'package:friend_list/view/friend_list.dart';
import 'package:friend_list/view/setting.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class BottomNavigationBarRouter extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  @override
  final GlobalKey<NavigatorState>? navigatorKey = _navigatorKey;
  final WidgetRef ref;

  int get index => ref.watch(bottomNavigationBarRouteProvider);
  StateController<int> get provider => ref.read(bottomNavigationBarRouteProvider.notifier);

  BottomNavigationBarRouter(this.ref);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (index == 0) const MaterialPage(child: FriendList()),
        if (index == 1) const MaterialPage(child: Calender()),
        if (index == 2) const MaterialPage(child: Setting()),
      ],
      onPopPage: (route, result) {
        provider.state = 0;
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}
