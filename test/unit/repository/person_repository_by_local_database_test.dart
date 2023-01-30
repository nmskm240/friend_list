import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/entity/anniversary.dart';
import 'package:friend_list/entity/contact.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/repository/person_repository_by_local_database.dart';

import '../infrastructure/local/mock_database.dart';

void main() {
  test("new save", () async {
    final repository = PersonRepositoryByLocalDatbase(local: MockDatabase());
    final person = Person(
      name: "test person",
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
    final saved = await repository.save(person);
    expect(saved.id, isPositive);
    expect(saved.anniversaries.first.personID, isNotNull);
    expect(saved.contacts.first.personID, isNotNull);
  });
}
