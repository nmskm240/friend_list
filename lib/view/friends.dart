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
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: const Text("Test Friend"),
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  onTap: () async {
                    await Navigator.pushNamed(context, "/friends/detail");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
