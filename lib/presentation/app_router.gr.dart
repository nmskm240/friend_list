// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter() : super();

  @override
  final Map<String, PageFactory> pagesMap = {
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
    PersonListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonListPage(),
      );
    },
  };
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
