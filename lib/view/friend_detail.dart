import 'package:flutter/material.dart';

class FriendDetail extends StatelessWidget {
  const FriendDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // TODO: detail edit process
            },
            child: const Text("Edit"),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: back process
          },
        ),
        title: const Text("Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset("assets/demo/images/face_001.png"),
            ),
            const Center(
              child: Text(
                "佐藤花",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
