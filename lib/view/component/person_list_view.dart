import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/component/person_list_tile.dart';
import 'package:friend_list/provider/person_list_provider.dart';

class PersonListView extends ConsumerWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.read(personListProvider.notifier);

    return Expanded(
      child: RefreshIndicator(
        onRefresh: viewmodel.load,
        child: ref.watch(personListProvider).when(
              loading: CircularProgressIndicator.new,
              error: (error, stacktrace) => Text(error.toString()),
              data: (value) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return PersonListTile(
                      data: value.elementAt(index),
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}
