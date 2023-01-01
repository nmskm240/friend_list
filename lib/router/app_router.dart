import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/view/friend_detail.dart';
import 'package:friend_list/view/friend_edit.dart';
import 'package:friend_list/view/friend_list.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class AppRouter extends RouterDelegate<Empty>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Empty> {
  @override
  final GlobalKey<NavigatorState>? navigatorKey = _navigatorKey;
  final WidgetRef ref;

  String get route => ref.watch(appRouteProvider);
  StateController<String> get provider => ref.read(appRouteProvider.notifier);

  AppRouter(this.ref);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: FriendList()),
        if ("/detail" == route) const MaterialPage(child: FriendDetail()),
        if ("/edit" == route) const MaterialPage(child: FriendEdit()),
      ],
      onPopPage: (route, result) {
        provider.state = '';
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Empty configuration) async {}
}

class Empty {}
