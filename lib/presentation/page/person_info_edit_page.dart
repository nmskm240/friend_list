import 'package:flutter/material.dart';
import 'package:friend_list/presentation/widget/list_view_with_header.dart';

class PersonInfoEditPage extends StatelessWidget {
  const PersonInfoEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <IconButton>[
          IconButton(
            onPressed: () {
              //TODO: save to database
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          const ListViewWithHeader(
            scrollLock: true,
            title: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/default_avatar.png"),
              ),
            ),
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  label: Text("name"),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text("nickname"),
                ),
              ),
            ],
          ),
          const Divider(),
          ListViewWithHeader(
            scrollLock: true,
            leading: const Text("Anniversary"),
            action: IconButton(
              onPressed: () {
                //TODO: create new anniversary
              },
              icon: const Icon(Icons.add),
            ),
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  label: Text("birthdate"),
                ),
                controller: TextEditingController(text: "XXXX/YY/ZZ"),
              ),
              TextField(
                decoration: InputDecoration(
                  label: const Text("custom anniversary"),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      //TODO: delete anniversary
                    },
                  ),
                ),
                controller: TextEditingController(text: "XXXX/YY/ZZ"),
              ),
            ],
          ),
          const Divider(),
          ListViewWithHeader(
            scrollLock: true,
            leading: const Text("Contact"),
            action: IconButton(
              onPressed: () {
                //TODO: create new contact
              },
              icon: const Icon(Icons.add),
            ),
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  label: const Text("phone"),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      //TODO: delete contact
                    },
                  ),
                ),
                controller: TextEditingController(text: "000-0000-0000"),
              ),
            ],
          ),
          const Divider(),
          ListViewWithHeader(
            scrollLock: true,
            leading: const Text("Tag"),
            action: IconButton(
              onPressed: () {
                //TODO: create or select tag
              },
              icon: const Icon(Icons.add),
            ),
            children: <Widget>[
              Wrap(
                spacing: 5,
                children: <InputChip>[
                  InputChip(
                    label: const Text("test"),
                    onDeleted: () {
                      //TODO: remove tag
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
