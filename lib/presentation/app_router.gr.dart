// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super();

  @override
  final Map<String, PageFactory> pagesMap = {
    AnniversaryCalendarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnniversaryCalendarPage(),
      );
    },
    AnniversaryDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AnniversaryDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnniversaryDetailPage(
          key: args.key,
          anniversary: args.anniversary,
        ),
      );
    },
    AnniversaryEditRoute.name: (routeData) {
      final args = routeData.argsAs<AnniversaryEditRouteArgs>();
      return AutoRoutePage<Anniversary>(
        routeData: routeData,
        child: AnniversaryEditPage(
          key: args.key,
          person: args.person,
          anniversary: args.anniversary,
        ),
      );
    },
    ContactEditRoute.name: (routeData) {
      final args = routeData.argsAs<ContactEditRouteArgs>();
      return AutoRoutePage<Contact>(
        routeData: routeData,
        child: ContactEditPage(
          key: args.key,
          person: args.person,
          contact: args.contact,
        ),
      );
    },
    PersonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PersonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonDetailPage(
          key: args.key,
          person: args.person,
        ),
      );
    },
    PersonEditRoute.name: (routeData) {
      final args = routeData.argsAs<PersonEditRouteArgs>();
      return AutoRoutePage<Person>(
        routeData: routeData,
        child: PersonEditPage(
          key: args.key,
          person: args.person,
        ),
      );
    },
    PersonListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonListPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
  };
}

/// generated route for
/// [AnniversaryCalendarPage]
class AnniversaryCalendarRoute extends PageRouteInfo<void> {
  const AnniversaryCalendarRoute({List<PageRouteInfo>? children})
      : super(
          AnniversaryCalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnniversaryCalendarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnniversaryDetailPage]
class AnniversaryDetailRoute extends PageRouteInfo<AnniversaryDetailRouteArgs> {
  AnniversaryDetailRoute({
    Key? key,
    required Anniversary anniversary,
    List<PageRouteInfo>? children,
  }) : super(
          AnniversaryDetailRoute.name,
          args: AnniversaryDetailRouteArgs(
            key: key,
            anniversary: anniversary,
          ),
          initialChildren: children,
        );

  static const String name = 'AnniversaryDetailRoute';

  static const PageInfo<AnniversaryDetailRouteArgs> page =
      PageInfo<AnniversaryDetailRouteArgs>(name);
}

class AnniversaryDetailRouteArgs {
  const AnniversaryDetailRouteArgs({
    this.key,
    required this.anniversary,
  });

  final Key? key;

  final Anniversary anniversary;

  @override
  String toString() {
    return 'AnniversaryDetailRouteArgs{key: $key, anniversary: $anniversary}';
  }
}

/// generated route for
/// [AnniversaryEditPage]
class AnniversaryEditRoute extends PageRouteInfo<AnniversaryEditRouteArgs> {
  AnniversaryEditRoute({
    Key? key,
    required Person person,
    required Anniversary anniversary,
    List<PageRouteInfo>? children,
  }) : super(
          AnniversaryEditRoute.name,
          args: AnniversaryEditRouteArgs(
            key: key,
            person: person,
            anniversary: anniversary,
          ),
          initialChildren: children,
        );

  static const String name = 'AnniversaryEditRoute';

  static const PageInfo<AnniversaryEditRouteArgs> page =
      PageInfo<AnniversaryEditRouteArgs>(name);
}

class AnniversaryEditRouteArgs {
  const AnniversaryEditRouteArgs({
    this.key,
    required this.person,
    required this.anniversary,
  });

  final Key? key;

  final Person person;

  final Anniversary anniversary;

  @override
  String toString() {
    return 'AnniversaryEditRouteArgs{key: $key, person: $person, anniversary: $anniversary}';
  }
}

/// generated route for
/// [ContactEditPage]
class ContactEditRoute extends PageRouteInfo<ContactEditRouteArgs> {
  ContactEditRoute({
    Key? key,
    required Person person,
    required Contact contact,
    List<PageRouteInfo>? children,
  }) : super(
          ContactEditRoute.name,
          args: ContactEditRouteArgs(
            key: key,
            person: person,
            contact: contact,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactEditRoute';

  static const PageInfo<ContactEditRouteArgs> page =
      PageInfo<ContactEditRouteArgs>(name);
}

class ContactEditRouteArgs {
  const ContactEditRouteArgs({
    this.key,
    required this.person,
    required this.contact,
  });

  final Key? key;

  final Person person;

  final Contact contact;

  @override
  String toString() {
    return 'ContactEditRouteArgs{key: $key, person: $person, contact: $contact}';
  }
}

/// generated route for
/// [PersonDetailPage]
class PersonDetailRoute extends PageRouteInfo<PersonDetailRouteArgs> {
  PersonDetailRoute({
    Key? key,
    required Person person,
    List<PageRouteInfo>? children,
  }) : super(
          PersonDetailRoute.name,
          args: PersonDetailRouteArgs(
            key: key,
            person: person,
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
    required this.person,
  });

  final Key? key;

  final Person person;

  @override
  String toString() {
    return 'PersonDetailRouteArgs{key: $key, person: $person}';
  }
}

/// generated route for
/// [PersonEditPage]
class PersonEditRoute extends PageRouteInfo<PersonEditRouteArgs> {
  PersonEditRoute({
    Key? key,
    required Person person,
    List<PageRouteInfo>? children,
  }) : super(
          PersonEditRoute.name,
          args: PersonEditRouteArgs(
            key: key,
            person: person,
          ),
          initialChildren: children,
        );

  static const String name = 'PersonEditRoute';

  static const PageInfo<PersonEditRouteArgs> page =
      PageInfo<PersonEditRouteArgs>(name);
}

class PersonEditRouteArgs {
  const PersonEditRouteArgs({
    this.key,
    required this.person,
  });

  final Key? key;

  final Person person;

  @override
  String toString() {
    return 'PersonEditRouteArgs{key: $key, person: $person}';
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

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
