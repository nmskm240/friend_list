import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          return const ListTile(
            title: Text("Test Person"),
            subtitle: Text("nickname"),
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/default_avatar.png"),
            ),
            trailing: Text("XX years old"),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
