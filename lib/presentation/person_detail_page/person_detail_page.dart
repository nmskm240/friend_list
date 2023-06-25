import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_detail_page/notifier/person_detail_page_notifier.dart';
import 'package:friend_list/presentation/person_detail_page/provider/person_detail_page_provider.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';
import 'package:intl/intl.dart';

final _localprovider = StateNotifierProvider.autoDispose<
    PersonDetailPageNotifier, PersonDetailPageState>((ref) {
  throw UnimplementedError();
});
final _tabs = {
  "Anniversary": const _AnniversaryTabView(),
  "Contact": const _ContactTabView(),
};

@RoutePage()
class PersonDetailPage extends StatelessWidget {
  final Person _person;

  const PersonDetailPage({
    super.key,
    required Person person,
  }) : _person = person;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        _localprovider.overrideWith(
            (ref) => ref.read(personDetailPage.call(_person).notifier)),
      ],
      child: const Scaffold(
        appBar: _AppBar(),
        body: _Body(),
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_localprovider.notifier);
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () async {
            await notifier.onPressedDeleteButton();
            ref.read(router).pop();
          },
          icon: const Icon(Icons.delete),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const _Header(),
            const _TabBar(),
          ];
        },
        body: const _Main(),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_localprovider);
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: MemoryImage(state.icon),
                        ),
                      ),
                      Text(
                        state.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        state.nickname,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        state.formatedAge,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  const _TabBar();

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: false,
      pinned: true,
      delegate: _TabBarDelegate(
        bar: TabBar(
          unselectedLabelColor: Colors.black45,
          labelColor: Colors.black87,
          tabs: _tabs.keys
              .map(
                (e) => Tab(
                  child: Text(e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  const _TabBarDelegate({required this.bar});

  final TabBar bar;

  @override
  double get maxExtent => bar.preferredSize.height;

  @override
  double get minExtent => bar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: bar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return bar != oldDelegate.bar;
  }
}

class _Main extends StatelessWidget {
  const _Main();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: _tabs.values.toList(),
    );
  }
}

class _AnniversaryTabView extends ConsumerWidget {
  const _AnniversaryTabView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anniversaries =
        ref.watch(_localprovider.select((value) => value.anniversaries));
    final notifier = ref.read(_localprovider.notifier);
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final anniversary = anniversaries.elementAt(index);
              return ListTile(
                title: Text(anniversary.name),
                subtitle: Text(DateFormat.yMd().format(anniversary.date)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  await notifier.onPressedAnniveraryListTile(anniversary);
                },
              );
            },
            childCount: anniversaries.length,
          ),
        ),
      ],
    );
  }
}

class _ContactTabView extends ConsumerWidget {
  const _ContactTabView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts =
        ref.watch(_localprovider.select((value) => value.contacts));
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final contact = contacts.elementAt(index);
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.value),
                leading: Icon(contact.method.icon),
              );
            },
            childCount: contacts.length,
          ),
        ),
      ],
    );
  }
}
