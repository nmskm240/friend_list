import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:intl/intl.dart';

@RoutePage()
class AnniversaryDetailPage extends StatelessWidget {
  final Anniversary state;

  const AnniversaryDetailPage({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context.router.pushNamed("/anniversary/edit"),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(state.name),
            leading: const Icon(Icons.notes),
          ),
          ListTile(
            title: Text(DateFormat.yMd().format(state.date)),
            leading: const Icon(Icons.calendar_today),
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
