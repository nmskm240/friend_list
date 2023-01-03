import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_list/component/listview_with_header.dart';
import 'package:friend_list/core/database/friend_database.dart';
import 'package:friend_list/model/friend.dart';
import 'package:friend_list/provider/app_router_provider.dart';
import 'package:friend_list/provider/friend_select_provider.dart';

class FriendDetail extends ConsumerWidget {
  const FriendDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var id = ref.watch(friendSelectProvider.notifier).state;
    return Scaffold(
      body: FutureBuilder(
        future: FriendDatabase.instance.getAt(id),
        builder: (context, AsyncSnapshot<Friend> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            // TODO: error process
            return const Text("error");
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // TODO: edit process
                      ref.read(appRouteProvider.notifier).state =
                          "/friend/edit";
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
                          backgroundImage:
                              MemoryImage(base64Decode(snapshot.data!.icon!)),
                        ),
                        Text(
                          snapshot.data!.name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        if (snapshot.data!.nickname != null)
                          Text(
                            snapshot.data!.nickname!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        if (snapshot.data!.age != null)
                          Text(
                            '${snapshot.data!.age} years old',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Card(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.phone,
                              ),
                              onPressed: () {
                                // TODO: other app open
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.mapLocation,
                              ),
                              onPressed: () {
                                // TODO: other app open
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.facebook,
                              ),
                              onPressed: () {
                                // TODO: other app open
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.instagram,
                              ),
                              onPressed: () {
                                // TODO: other app open
                              },
                            ),
                            IconButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.twitter,
                              ),
                              onPressed: () {
                                // TODO: other app open
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
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
          );
        },
      ),
    );
  }
}
