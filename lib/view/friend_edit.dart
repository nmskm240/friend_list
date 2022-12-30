import 'package:flutter/material.dart';

class FriendEdit extends StatelessWidget {
  const FriendEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //TODO: edit process
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Form(
            child: Column(
              children: <Widget>[
                const CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 100,
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("name"),
                    icon: Icon(Icons.person),
                  ),
                ),
                Column(
                  children: const <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Birthday"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
