import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_provider.dart';

class PersonListPage extends ConsumerWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifyer = ref.watch(personListProvider);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/edit");
            },
          ),
        ],
      ),
      body: notifyer.when(
        data: (summaries) {
          return ListView.builder(
            itemCount: summaries.length,
            itemBuilder: (context, index) {
              final person = summaries.elementAt(index);
              return ListTile(
                title: Text(person.name),
                subtitle: Text(person.nickname),
                leading: CircleAvatar(
                  backgroundImage: MemoryImage(person.icon),
                ),
                trailing: const Text("XX years old"),
                onTap: () {
                  Navigator.of(context).pushNamed("/detail");
                },
              );
            },
          );
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
