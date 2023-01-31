import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:friend_list/presentation/common/always_disabled_focus_node.dart';
import 'package:friend_list/presentation/widget/list_view_with_header.dart';

class AnniversaryEditPage extends StatelessWidget {
  const AnniversaryEditPage({super.key});

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
          children: [
            const TextField(
              decoration: InputDecoration(
                label: Text("name"),
              ),
            ),
            TextField(
              focusNode: AlwaysDisabledFocusNode(),
              decoration: const InputDecoration(
                label: Text("date"),
              ),
              onTap: () {
                DatePicker.showDatePicker(context);
                //TODO: set picked date to text field
              },
            ),
            const Divider(),
            ListViewWithHeader(
              scrollLock: true,
              leading: const Text("Notification"),
              action: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  //TODO: set new notification schedule
                },
              ),
              children: <Widget>[
                TextField(
                  focusNode: AlwaysDisabledFocusNode(),
                  controller: TextEditingController(text: "X day before"),
                  decoration: InputDecoration(
                    suffix: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        //TODO: delete this notification
                      },
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        final options = [
                          "1 day before",
                          "1 week before",
                          "1 month before"
                        ];
                        return ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(options[index]),
                              onTap: () {
                                //TODO: add to list
                                Navigator.of(context).pop();
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                const Divider(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
