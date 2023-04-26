import 'package:flutter/material.dart';

class ImagePickErrorDialog extends StatelessWidget {
  const ImagePickErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Error"),
      content: const Text(
          "Access to the gallery is not allowed or an unknown error has occurred."),
      actions: [
        TextButton(
          child: const Text("close"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
