import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_page_provider.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonListPage extends ConsumerWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(personListPageProvider);
    final notifier = ref.watch(personListPageProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => notifier.onPressedAddPerson(),
          ),
        ],
      ),
      body: state.when(
        data: (persons) {
          if (persons.isEmpty) {
            return Center(
              child: Column(
                children: const [
                  Icon(Icons.people),
                  Text(Strings.nonRegistered),
                ],
              ),
            );
          } else {
            return ListView.builder(
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
                  onTap: () async {
                    await notifier.onPressedPersonListTile(person);
                  },
                );
              },
            );
          }
        },
        error: ((error, stackTrace) {
          debugPrint(stackTrace.toString());
          return Text(error.toString());
        }),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
