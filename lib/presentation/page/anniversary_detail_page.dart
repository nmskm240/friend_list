import 'package:flutter/material.dart';

class AnniversaryDetailPage extends StatelessWidget {
  const AnniversaryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Anniversary"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              //TODO: show anniversay edit page and set this data
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const ListTile(
            title: Text("This is demo anniversary"),
            leading: Icon(Icons.notes),
          ),
          const ListTile(
            title: Text("XXXX/YY/ZZ"),
            leading: Icon(Icons.calendar_today),
          ),
          const ListTile(
            title: Text("Repeated XX times"),
            leading: Icon(Icons.repeat),
          ),
          ListTile(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: const <Widget>[
                  Text("X day before"),
                  Text("Y day before"),
                ],
              ),
            ),
            leading: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
