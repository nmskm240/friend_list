import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_detail_page/person_detail_page.dart';
import 'package:friend_list/presentation/person_list_page/person_list_page.dart';

part 'app_router.gr.dart';

final routerProvider = Provider<AppRouter>((ref) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PersonListRoute.page, path: "/", initial: true),
    AutoRoute(page: PersonDetailRoute.page, path: "/detail"),
  ];
}