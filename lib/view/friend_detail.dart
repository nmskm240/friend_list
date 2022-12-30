import 'package:flutter/material.dart';

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
            expandedHeight: 210,
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
                        fontWeight: FontWeight.bold,
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.cake),
                      Text("XXXX/YY/ZZ (AA years old)"),
                    ],
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.cake),
                    title: Text("XXnd birthday!"),
                  ),
                ),
                const Card(
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
    );
  }
}
