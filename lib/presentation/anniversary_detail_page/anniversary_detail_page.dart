import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:intl/intl.dart';

@RoutePage()
class AnniversaryDetailPage extends ConsumerWidget {
  @protected
  final Anniversary anniversary;

  const AnniversaryDetailPage({
    super.key,
    required this.anniversary,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anniversary.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final person = await ref
                  .read(personRepository)
                  .findByID(anniversary.personId);
              ref.read(router).push(AnniversaryEditRoute(
                  person: person, anniversary: anniversary));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(anniversary.name),
            leading: const Icon(Icons.notes),
          ),
          ListTile(
            title: Text(DateFormat.yMd().format(anniversary.date)),
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
