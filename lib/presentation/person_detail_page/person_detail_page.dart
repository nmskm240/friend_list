import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/strings.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

@RoutePage()
class PersonDetailPage extends ConsumerWidget {
  @protected
  final Person person;

  const PersonDetailPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await ref.read(personRepository).deleteByID(person.id);
              ref.read(router).pop();
            },
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
                              backgroundImage: MemoryImage(person.icon),
                            ),
                          ),
                          Text(
                            person.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            person.nickname,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            sprintf(Strings.yearsOldFormat, [
                              person.hasBirthdate ? person.age.toString() : "??"
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
                                    itemCount: person.contacts.length,
                                    itemBuilder: (context, index) {
                                      final contact =
                                          person.contacts.elementAt(index);
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
                            onPressed: () {
                              ref
                                  .read(router)
                                  .push(PersonEditRoute(person: person));
                            },
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
                final anniversary = person.anniversaries.elementAt(index);
                return ListTile(
                  title: Text(anniversary.name),
                  subtitle: Text(DateFormat.yMd().format(anniversary.date)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    ref.read(router).push(AnniversaryEditRoute(
                        person: person, anniversary: anniversary));
                  },
                );
              },
              childCount: person.anniversaries.length,
            ),
          )
        ],
      ),
    );
  }
}
