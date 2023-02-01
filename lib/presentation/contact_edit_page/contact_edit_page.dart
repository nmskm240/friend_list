import 'package:flutter/material.dart';
import 'package:friend_list/presentation/common/always_disabled_focus_node.dart';

class ContactEditPage extends StatelessWidget {
  const ContactEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              //TODO: save edit data
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            TextField(
              focusNode: AlwaysDisabledFocusNode(),
              decoration: const InputDecoration(
                label: Text("method"),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      final methods = [
                        "phone",
                        "address",
                        "twitter",
                        "facebook",
                        "instagram",
                      ];
                      return ListView.builder(
                        itemCount: methods.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(methods[index]),
                          );
                        },
                      );
                    });
              },
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("value"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
