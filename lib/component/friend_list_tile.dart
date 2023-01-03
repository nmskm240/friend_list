import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/model/friend.dart';
import 'package:intl/intl.dart';

class FriendListTile extends ConsumerWidget {
  Friend data;
  Function()? onTap;
  Function()? onLongPress;

  FriendListTile({Key? key, required this.data, this.onTap, this.onLongPress})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      key: key,
      title: Text(data.name),
      subtitle: Text(data.nickname ?? ""),
      leading: CircleAvatar(
        backgroundImage: MemoryImage(base64Decode(data.icon!)),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(data.birthday == null
              ? "unknown birthday"
              : DateFormat("yyyy/MM/dd").format(data.birthday!)),
          Text('${data.age ?? "?"} years old'),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
