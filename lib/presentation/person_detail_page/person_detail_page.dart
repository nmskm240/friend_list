import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/person_detail_page/provider/person_detail_page_provider.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonDetailPage extends ConsumerWidget {
  final Person domain;

  const PersonDetailPage({super.key, required this.domain});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = personDetailPageProvider(domain);
    final state = ref.watch(provider);
    final notifier = ref.read(provider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: notifier.onPressedDeleteButton,
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 175,
            leading: const Spacer(),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Expanded(
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
                            sprintf(Strings.yearsOldFormat, [
                              state.age == null ? "??" : state.age.toString()
                            ]),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (builder) {
                                  return ListView.builder(
                                    itemCount: state.contacts.length,
                                    itemBuilder: (context, index) {
                                      final contact =
                                          state.contacts.elementAt(index);
                                      return ListTile(
                                        leading: Icon(contact.method.icon),
                                        title: Text(contact.method.name),
                                        subtitle: Text(contact.value),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Icons.contacts),
                          ),
                          ElevatedButton.icon(
                            onPressed: () =>
                                notifier.onPressedEditButton(domain),
                            icon: const Icon(Icons.edit),
                            label: const Text(Strings.editButtonLable),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final anniversary = state.anniversaries.elementAt(index);
                return ListTile(
                  title: Text(anniversary.name),
                  subtitle: Text(DateFormat.yMd().format(anniversary.date)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () =>
                      notifier.onPressedAnniversaryListTile(anniversary),
                );
              },
              childCount: state.anniversaries.length,
            ),
          )
        ],
      ),
    );
  }
}
