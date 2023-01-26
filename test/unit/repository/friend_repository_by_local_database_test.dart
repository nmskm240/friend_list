import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/friend.dart';
import 'package:friend_list/repository/friend_repository_by_local_database.dart';

import '../infrastructure/local/mock_database.dart';

void main() {
  test("new save", () async {
    final repository = FriendRepositoryByLocalDatbase(local: MockDatabase());
    final friend = Friend(
      name: "test friend",
      nickname: "test",
      icon: "test icon",
      anniversaries: [
        Anniversary(
          name: "birthday",
          date: DateTime(2000, 1, 1),
        ),
      ],
      contacts: [
        const Contact(
          method: ContactMethodType.twitter,
          value: "test",
        ),
      ],
    );
    final saved = await repository.save(friend);
    expect(saved.id, isPositive);
    expect(saved.anniversaries.first.friendID, isNotNull);
    expect(saved.contacts.first.friendID, isNotNull);
  });
}
