// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AnniversaryDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnniversaryDetailPage(),
      );
    },
    AnniversaryEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnniversaryEditPage(),
      );
    },
    ContactEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactEditPage(),
      );
    },
    PersonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PersonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonDetailPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    PersonEditRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonEditPage(),
      );
    },
    PersonListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonListPage(),
      );
    },
  };
}

/// generated route for
/// [AnniversaryDetailPage]
class AnniversaryDetailRoute extends PageRouteInfo<void> {
  const AnniversaryDetailRoute({List<PageRouteInfo>? children})
      : super(
          AnniversaryDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnniversaryDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnniversaryEditPage]
class AnniversaryEditRoute extends PageRouteInfo<void> {
  const AnniversaryEditRoute({List<PageRouteInfo>? children})
      : super(
          AnniversaryEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnniversaryEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ContactEditPage]
class ContactEditRoute extends PageRouteInfo<void> {
  const ContactEditRoute({List<PageRouteInfo>? children})
      : super(
          ContactEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonDetailPage]
class PersonDetailRoute extends PageRouteInfo<PersonDetailRouteArgs> {
  PersonDetailRoute({
    Key? key,
    required String id,
    List<PageRouteInfo>? children,
  }) : super(
          PersonDetailRoute.name,
          args: PersonDetailRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonDetailRoute';

  static const PageInfo<PersonDetailRouteArgs> page =
      PageInfo<PersonDetailRouteArgs>(name);
}

class PersonDetailRouteArgs {
  const PersonDetailRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final String id;

  @override
  String toString() {
    return 'PersonDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [PersonEditPage]
class PersonEditRoute extends PageRouteInfo<void> {
  const PersonEditRoute({List<PageRouteInfo>? children})
      : super(
          PersonEditRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonEditRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonListPage]
class PersonListRoute extends PageRouteInfo<void> {
  const PersonListRoute({List<PageRouteInfo>? children})
      : super(
          PersonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
