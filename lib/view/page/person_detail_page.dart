import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/provider/person_select_provider.dart';

class PersonDetailPage extends ConsumerWidget {
  const PersonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(personSelectProvider.notifier).state;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  ref.read(appRouteProvider.notifier).state = "/person/edit";
                },
              ),
            ],
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: MemoryImage(base64Decode(data!.icon)),
                    ),
                    Text(
                      data.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    if (data.nickname.isNotEmpty)
                      Text(
                        data.nickname,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      //TODO: display age
                    // if (data.age != null)
                    //   Text(
                    //     '${data.age} years old',
                    //     style: Theme.of(context).textTheme.bodyLarge,
                    //   ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Card(
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: data.contacts?.length ?? 0,
                //     itemBuilder: (context, index) {
                //       return IconButton(
                //         icon: FaIcon(
                //           data.contacts!.elementAt(index).method.icon,
                //         ),
                //         onPressed: () {
                //           // TODO: other app open
                //         },
                //       );
                //     },
                //   ),
                // ),
                Card(
                  child: ListViewWithHeader(
                    title: "Anniversary",
                    children: <Widget>[
                      ListTile(
                        title: const Text("Birthday"),
                        subtitle: const Text("XXXX/YY/ZZ"),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          // TODO: remind setting process
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ListViewWithHeader(
                    title: "Tag",
                    children: <Widget>[
                      ListTile(
                        title: Wrap(
                          children: const <Widget>[
                            Chip(
                              label: Text("test"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ListViewWithHeader(
                    title: "History",
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: add note
                      },
                    ),
                    children: const <Widget>[
                      SizedBox(
                        height: 40,
                        child: ListTile(
                          tileColor: Colors.transparent,
                          title: Text("XXXX/YY"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.cake),
                          title: Text("XXnd birthday!"),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListTile(
                          tileColor: Colors.transparent,
                          title: Text("XXXX/ZZ"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.sticky_note_2),
                          title: Text("memo"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
