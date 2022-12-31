import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:friend_list/component/listview_with_header.dart';

class FriendDetail extends StatelessWidget {
  const FriendDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // TODO: edit process
                },
              ),
            ],
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage("assets/demo/images/face_001.png"),
                    ),
                    Text(
                      "Test Friend",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "nickname",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "XX years old",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
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
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // TODO: other app open
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.mapLocation,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // TODO: other app open
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // TODO: other app open
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            // TODO: other app open
                          },
                        ),
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.grey,
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
                    children: <Widget> [
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
