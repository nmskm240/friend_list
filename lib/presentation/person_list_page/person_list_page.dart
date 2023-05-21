import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/service.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonListPage extends ConsumerWidget {
  final _controller = TextEditingController();

  PersonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFiltering = ref.watch(filterMode);
    final asyncValue = ref.watch(filteredPersons);
    return Scaffold(
      appBar: AppBar(
        actions: isFiltering
            ? <Widget>[]
            : <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    ref.read(filterMode.notifier).state = true;
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    ref.read(router).push(PersonEditRoute());
                  },
                ),
              ],
        title: isFiltering
            ? TextField(
                autofocus: true,
                onChanged: (value) {
                  ref.read(personFileter.notifier).state = value;
                },
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffix: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      ref.invalidate(personFileter);
                      ref.read(filterMode.notifier).state = false;
                    },
                  ),
                ),
              )
            : null,
      ),
      body: asyncValue.when(
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
                  onTap: () {
                    ref.read(router).push(PersonDetailRoute(person: person));
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
