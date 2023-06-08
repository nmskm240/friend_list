import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AnniversaryCalendarPage extends StatelessWidget {
  const AnniversaryCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("calendar"),
      ),
    );
  }
}
