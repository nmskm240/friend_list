import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:friend_list/presentation/app_router.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
        PersonListRoute(),
        AnniversaryCalendarRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.person), label: "Persons"),
              NavigationDestination(icon: Icon(Icons.calendar_month), label: "Calendar"),
            ],
            onDestinationSelected: (value) {
              tabsRouter.setActiveIndex(value);
            },
          ),
        );
      },
    );
  }
}
