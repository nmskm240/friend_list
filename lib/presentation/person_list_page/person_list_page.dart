import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_page_provider.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonListPage extends StatelessWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return const Scaffold(
      appBar: _AppBar(),
      body: _Body(),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFiltering = ref
            .watch(personListPageProvider.select(
                (value) => value.whenData((state) => state.isFiltering)))
            .asData
            ?.value ??
        false;
    final controller = ref
        .watch(personListPageProvider.select(
            (value) => value.whenData((state) => state.searchBarController)))
        .asData
        ?.value;
    final notifier = ref.read(personListPageProvider.notifier);
    return AppBar(
      actions: <Widget>[
        if (!isFiltering)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              await notifier.onSwitchSearchMode(true);
            },
          ),
        if (!isFiltering)
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () async {
              notifier.onChangedSortOrder();
            },
          ),
        if (!isFiltering)
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await notifier.onPressedAddPerson();
            },
          ),
      ],
      title: isFiltering
          ? TextField(
              autofocus: true,
              onChanged: (value) async {
                await notifier.onChangedSearchBar(value);
              },
              textInputAction: TextInputAction.done,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffix: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () async {
                    notifier.onSwitchSearchMode(false);
                  },
                ),
              ),
            )
          : null,
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref
            .watch(personListPageProvider
                .select((value) => value.whenData((state) => state.persons)));
    final notifier = ref.read(personListPageProvider.notifier);
    return asyncValue.when(
      error: (error, stacktrace) {
        debugPrintStack();
        return Text(error.toString());
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      data: (persons) {
      return persons.isEmpty
        ? const Center(
            child: Column(
              children: [
                Icon(Icons.people),
                Text(Strings.nonRegistered),
              ],
            ),
          )
        : ListView.builder(
            itemCount: persons.length,
            itemBuilder: (context, index) {
              final person = persons.elementAt(index);
              return ListTile(
                title: Text(person.name),
                subtitle: Text(person.nickname),
                leading: CircleAvatar(
                  backgroundImage: MemoryImage(person.icon),
                ),
                trailing: person.hasBirthdate
                    ? Text(sprintf(Strings.yearsOldFormat, [person.age]))
                    : null,
                onTap: () {
                  notifier.onPressedPersonListTile(person);
                },
              );
            },
          );
    },);
     
  }
}
