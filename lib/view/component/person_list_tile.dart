import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/provider/defaultIconProvider.dart';
import 'package:intl/intl.dart';

class PersonListTile extends ConsumerWidget {
  final Person data;
  final Function()? onTap;
  final Function()? onLongPress;

  const PersonListTile({Key? key, required this.data, this.onTap, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultIcon = ref.watch(defaultIconProvider);
    return ListTile(
      key: key,
      title: Text(data.name),
      subtitle: Text(data.nickname),
      leading: CircleAvatar(
        backgroundImage: data.icon.isEmpty
            ? AssetImage(defaultIcon) as ImageProvider
            : MemoryImage(base64.decode(data.icon)),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(data.birthdate == null
              ? "unknown birthday"
              : DateFormat("yyyy/MM/dd").format(data.birthdate!.date)),
          Text('${data.age ?? "?"} years old'),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
