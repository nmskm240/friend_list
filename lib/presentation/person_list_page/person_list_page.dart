import 'package:flutter/material.dart';

class PersonListPage extends StatelessWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text("Test Person"),
            subtitle: const Text("nickname"),
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/default_avatar.png"),
            ),
            trailing: const Text("XX years old"),
            onTap: () {
              Navigator.of(context).pushNamed("/detail");
            },
          );
        },
        itemCount: 20,
      ),
    );
  }
}
