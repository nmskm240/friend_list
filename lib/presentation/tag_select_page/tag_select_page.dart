import 'package:flutter/material.dart';

class TagSelectPage extends StatelessWidget {
  const TagSelectPage({super.key});

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
      body: Column(
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(hintText: "search"),
          ),
          ListTile(
            title: RichText(
              text: const TextSpan(
                children: <InlineSpan>[
                  WidgetSpan(
                    child: Icon(
                      Icons.add,
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(
                    text: 'New',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("/tag/edit");
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text("Demo tag"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
