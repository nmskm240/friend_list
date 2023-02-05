import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/contact/contact.dart';
import 'package:friend_list/domain/contact/contact_service.dart';

import '../../infrastructure/contact/auto_increment_contact_factory.dart';
import '../../infrastructure/contact/in_memory_contact_repository.dart';

void main() {
  group("is duplicated test", () {
    late ContactService service;
    late Contact registred;
    setUp(() {
      final factory = AutoIncrementContactFactory();
      registred = factory.create(
          "Test contact", ContactMethod.phone, "000-0000-0000", "1");
      final repository = InMemoryContactRepository([
        registred,
      ]);
      service = ContactService(factory, repository);
    });

    test("All match", () async {
      final contact = registred.copyWith();
      expect(await service.isDuplicated(contact), isTrue);
    });

    group("Same name", () {
      test("Diffrent value", () async {
        final contact = registred.copyWith(value: "@hoge");
        expect(await service.isDuplicated(contact), isFalse);
      });
      test("Diffrent method", () async {
        final contact = registred.copyWith(method: ContactMethod.twitter);
        expect(await service.isDuplicated(contact), isFalse);
      });
      test("Diffrent method and value", () async {
        final contact =
            registred.copyWith(method: ContactMethod.twitter, value: "@hoge");
        expect(await service.isDuplicated(contact), isFalse);
      });
    });

    test("Other person id", () async {
      final contact = registred.copyWith(personId: "other");
      expect(await service.isDuplicated(contact), isFalse);
    });
  });
}
