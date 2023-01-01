import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:friend_list/component/listview_with_header.dart';

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
      body: ListView(
        children: <Widget>[
          Padding(
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
                  Card(
                    child: ListViewWithHeader(
                      title: "Profile",
                      children: <Widget>[
                        ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("name"),
                            ),
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("nickname"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ListViewWithHeader(
                      title: "Anniversary",
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // TODO: add process
                        },
                      ),
                      children: <Widget>[
                        ListTile(
                          title: TextFormField(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DatePicker.showDatePicker(
                                context,
                                maxTime: DateTime.now(),
                              );
                            },
                            decoration: const InputDecoration(
                              label: Text("Birthday"),
                            ),
                            controller: TextEditingController(
                              text: "XXXX/YY/ZZ",
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: delete process
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ListViewWithHeader(
                      title: "Contact",
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // TODO: add process
                        },
                      ),
                      children: <Widget>[
                        ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Phone"),
                            ),
                            controller: TextEditingController(
                              text: "000-0000-0000",
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: delete process
                            },
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Address"),
                            ),
                            controller: TextEditingController(
                              text: "XXXXX XXXXXXX",
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: delete process
                            },
                          ),
                        ),
                        ListTile(
                          title: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Twitter"),
                            ),
                            controller: TextEditingController(
                              text: "@XXXX",
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: delete process
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ListViewWithHeader(
                      title: "Tag",
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // TODO: add process
                        },
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Wrap(
                            children: <Widget>[
                              Chip(
                                label: const Text("test"),
                                onDeleted: () {
                                  // TODO: delete process
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
