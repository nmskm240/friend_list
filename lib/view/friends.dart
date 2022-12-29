import 'package:flutter/material.dart';
import 'package:friend_list/component/search_bar.dart';

class Friends extends StatelessWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Friends"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: ListView(
              children: const <Widget>[
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test1"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test2"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test3"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test4"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test"),
                ),
                ListTile(
                  title: Text("test5"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
