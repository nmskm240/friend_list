import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_page_provider.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonListPage extends ConsumerWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(personListPageProvider);
    final notifier = ref.read(personListPageProvider.notifier);
    return asyncValue.when(
      error: ((error, stackTrace) {
        debugPrint(stackTrace.toString());
        return Text(error.toString());
      }),
      loading: () => const CircularProgressIndicator(),
      data: (state) {
        FlutterNativeSplash.remove();
        return Scaffold(
          appBar: AppBar(
            actions: state.isFiltering
                ? <Widget>[]
                : <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        await notifier.onSwitchSearchMode(true);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        await notifier.onPressedAddPerson();
                      },
                    ),
                  ],
            title: state.isFiltering
                ? TextField(
                    autofocus: true,
                    onChanged: (value) async {
                      await notifier.onChangedSearchBar(value);
                    },
                    textInputAction: TextInputAction.done,
                    controller: state.searchBarController,
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
          ),
          body: state.persons.isEmpty
              ? Center(
                  child: Column(
                    children: const [
                      Icon(Icons.people),
                      Text(Strings.nonRegistered),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: state.persons.length,
                  itemBuilder: (context, index) {
                    final person = state.persons.elementAt(index);
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
                ),
        ); 
      },
    );
  }
}
