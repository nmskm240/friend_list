import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/contact/contact.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/anniversary_detail_page/anniversary_detail_page.dart';
import 'package:friend_list/presentation/anniversary_edit_page/anniversary_edit_page.dart';
import 'package:friend_list/presentation/contact_edit_page/contact_edit_page.dart';
import 'package:friend_list/presentation/person_detail_page/person_detail_page.dart';
import 'package:friend_list/presentation/person_edit_page/person_edit_page.dart';
import 'package:friend_list/presentation/person_list_page/person_list_page.dart';

part 'app_router.gr.dart';

final router = Provider<AppRouter>((ref) => AppRouter());

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: PersonListRoute.page, path: "/", initial: true),
    AutoRoute(page: PersonEditRoute.page, path: "/edit"),
    AutoRoute(page: PersonDetailRoute.page, path: "/detail"),
    AutoRoute(page: AnniversaryEditRoute.page, path: "/anniversary/edit"),
    AutoRoute(page: AnniversaryDetailRoute.page, path: "/anniversary/detail"),
    AutoRoute(page: ContactEditRoute.page, path: "/contact/edit"),
  ];
}