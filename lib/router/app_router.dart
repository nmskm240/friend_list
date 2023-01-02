import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/view/friend_detail.dart';
import 'package:friend_list/view/friend_edit.dart';
import 'package:friend_list/view/navigation_bar.dart';

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
        MaterialPage(child: NavigatorBar(ref)),
        /* TODO: transitioning from the detail screen to the edit screen, 
            when the user returns to the edit screen, 
            the user is now redirected to the detail screen instead of the home screen.
        */
        if (route == "/friend/detail") const MaterialPage(child: FriendDetail()),
        if (route == "/friend/edit") const MaterialPage(child: FriendEdit()),
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
