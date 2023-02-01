import 'package:flutter/material.dart';

class TagEditPage extends StatelessWidget {
  const TagEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //TODO: save edit data
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: const TextField(
        decoration: InputDecoration(hintText: "name"),
      ),
    );
  }
}
