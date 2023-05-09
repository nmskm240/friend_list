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
      final args = routeData.argsAs<AnniversaryDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnniversaryDetailPage(
          key: args.key,
          state: args.state,
        ),
      );
    },
    AnniversaryEditRoute.name: (routeData) {
      final args = routeData.argsAs<AnniversaryEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AnniversaryEditPage(
          key: args.key,
          state: args.state,
          isDuplicated: args.isDuplicated,
          onSave: args.onSave,
        ),
      );
    },
    ContactEditRoute.name: (routeData) {
      final args = routeData.argsAs<ContactEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ContactEditPage(
          key: args.key,
          state: args.state,
          isDuplicated: args.isDuplicated,
          onSave: args.onSave,
        ),
      );
    },
    PersonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PersonDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonDetailPage(
          key: args.key,
          domain: args.domain,
        ),
      );
    },
    PersonEditRoute.name: (routeData) {
      final args = routeData.argsAs<PersonEditRouteArgs>(
          orElse: () => const PersonEditRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PersonEditPage(
          key: args.key,
          domain: args.domain,
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
/// [AnniversaryDetailPage]
class AnniversaryDetailRoute extends PageRouteInfo<AnniversaryDetailRouteArgs> {
  AnniversaryDetailRoute({
    Key? key,
    required Anniversary state,
    List<PageRouteInfo>? children,
  }) : super(
          AnniversaryDetailRoute.name,
          args: AnniversaryDetailRouteArgs(
            key: key,
            state: state,
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
    required this.state,
  });

  final Key? key;

  final Anniversary state;

  @override
  String toString() {
    return 'AnniversaryDetailRouteArgs{key: $key, state: $state}';
  }
}

/// generated route for
/// [AnniversaryEditPage]
class AnniversaryEditRoute extends PageRouteInfo<AnniversaryEditRouteArgs> {
  AnniversaryEditRoute({
    Key? key,
    Anniversary? state,
    required bool Function(String) isDuplicated,
    required void Function(
      String,
      DateTime,
    ) onSave,
    List<PageRouteInfo>? children,
  }) : super(
          AnniversaryEditRoute.name,
          args: AnniversaryEditRouteArgs(
            key: key,
            state: state,
            isDuplicated: isDuplicated,
            onSave: onSave,
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
    this.state,
    required this.isDuplicated,
    required this.onSave,
  });

  final Key? key;

  final Anniversary? state;

  final bool Function(String) isDuplicated;

  final void Function(
    String,
    DateTime,
  ) onSave;

  @override
  String toString() {
    return 'AnniversaryEditRouteArgs{key: $key, state: $state, isDuplicated: $isDuplicated, onSave: $onSave}';
  }
}

/// generated route for
/// [ContactEditPage]
class ContactEditRoute extends PageRouteInfo<ContactEditRouteArgs> {
  ContactEditRoute({
    Key? key,
    Contact? state,
    required bool Function(
      ContactMethod,
      String,
    ) isDuplicated,
    required void Function(
      String,
      ContactMethod,
      String,
    ) onSave,
    List<PageRouteInfo>? children,
  }) : super(
          ContactEditRoute.name,
          args: ContactEditRouteArgs(
            key: key,
            state: state,
            isDuplicated: isDuplicated,
            onSave: onSave,
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
    this.state,
    required this.isDuplicated,
    required this.onSave,
  });

  final Key? key;

  final Contact? state;

  final bool Function(
    ContactMethod,
    String,
  ) isDuplicated;

  final void Function(
    String,
    ContactMethod,
    String,
  ) onSave;

  @override
  String toString() {
    return 'ContactEditRouteArgs{key: $key, state: $state, isDuplicated: $isDuplicated, onSave: $onSave}';
  }
}

/// generated route for
/// [PersonDetailPage]
class PersonDetailRoute extends PageRouteInfo<PersonDetailRouteArgs> {
  PersonDetailRoute({
    Key? key,
    required Person domain,
    List<PageRouteInfo>? children,
  }) : super(
          PersonDetailRoute.name,
          args: PersonDetailRouteArgs(
            key: key,
            domain: domain,
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
    required this.domain,
  });

  final Key? key;

  final Person domain;

  @override
  String toString() {
    return 'PersonDetailRouteArgs{key: $key, domain: $domain}';
  }
}

/// generated route for
/// [PersonEditPage]
class PersonEditRoute extends PageRouteInfo<PersonEditRouteArgs> {
  PersonEditRoute({
    Key? key,
    Person? domain,
    List<PageRouteInfo>? children,
  }) : super(
          PersonEditRoute.name,
          args: PersonEditRouteArgs(
            key: key,
            domain: domain,
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
    this.domain,
  });

  final Key? key;

  final Person? domain;

  @override
  String toString() {
    return 'PersonEditRouteArgs{key: $key, domain: $domain}';
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
