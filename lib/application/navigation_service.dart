import 'dart:async';

import 'package:flutter/cupertino.dart';

class RouteRequest {}
class RouteResponce {}

class NavigationService {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  Future<T?> push<T>(String name, {RouteRequest? arguments}) async {
    final res = await key.currentState!.pushNamed(name, arguments: arguments);
    if(res == null) {
      return null;
    }
    return res as T;
  }

  FutureOr<void> pop({RouteResponce? res}) {
    key.currentState!.pop(res);
  }
}