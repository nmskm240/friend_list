import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/contact/i_contact_factory.dart';
import 'package:friend_list/domain/contact/i_contact_repositoty.dart';
import 'package:friend_list/infrastructure/contact/contact_repository.dart';

import 'auto_increment_contact_factory.dart';
import '../mock_database.dart';

void main() {
  group("mock database repositoy test", (() {
    late IContactFactory factory;
    late IContactRepository repository;
    setUp(() async {
      factory = AutoIncrementContactFactory();
      repository = ContactRepository(MockDatabae(enabledForeignKey: false));
      await repository.deleteAll();
    });

    test("insert", () async {
      final contact = factory.create("test name", ContactMethod.address, "test value", "1");
      await expectLater(repository.save(contact), completes);
    });

    test("update", () async {
      final contact = factory.create("test name", ContactMethod.address, "test value", "1");
      await repository.save(contact);
      final edited = contact.copyWith(name: "demo name", value: "demo value");
      await expectLater(repository.save(edited), completes);
    });

    test("delete", () async {
      final contact = factory.create("test name", ContactMethod.address, "test value", "1");
      await repository.save(contact);
      await expectLater(repository.deleteAllByPersonID("1"), completes);
    });
  }));
}
