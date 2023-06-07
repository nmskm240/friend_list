import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/person/anniversary/i_anniversary_factory.dart';
import 'package:friend_list/domain/person/contact/contact_method.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/contact/i_contact_factory.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';
import 'package:friend_list/infrastructure/person/anniversary/anniversary_factory.dart';
import 'package:friend_list/infrastructure/person/contact/contact_factory.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';

import '../mock_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await SharedPreferencesHelper.loadOrDefault();
  });

  group("mock database repositoy test", (() {
    final ILocalDataSource source = MockDatabae();
    late IPersonFactory factory;
    late IAnniversaryFactory aFactory;
    late IContactFactory cFactory;
    late IPersonRepository repository;
    setUp(() async {
      factory = PersonFactory();
      aFactory = AnniversaryFactory();
      cFactory = ContactFactory();
      repository = PersonRepository(source);
      await repository.deleteAll();
    });

    test("insert", () async {
      final person = factory.create(name: "test name");
      await expectLater(repository.save(person), completes);
    });

    group("find", () {
      late Person person;
      setUp(() async {
        person = factory.create(name: "demo name");
        person.addAnniversary(aFactory.create(person.id, name: "new anniversary", date: DateTime(2000)));
        person.addContact(cFactory.create(person.id, name: "new contact", method: ContactMethod.address, value: "test"));
        person.addContact(cFactory.create(person.id, name: "new contact", method: ContactMethod.phone, value: "test"));
        await repository.save(person);
      });
      test("with id", () async {
        final saved = await repository.findByID(person.id);
        expect(saved.anniversaries.length, equals(1));
        expect(saved.contacts.length, equals(2));
      });

      test("partical search", () async {
        final persons = [
          factory.create(name: "test name", nickname: "test nickname"),
          factory.create(name: "demo name", nickname: "demo nickname"),
          factory.create(name: "name test", nickname: "nickname test"),
          factory.create(name: "name demo", nickname: "nickname demo"),
        ];
        for (final person in persons) {
          await repository.save(person);
        }
        final searched = await repository.findByNameOrNickname("tes");
        expect(searched.length, equals(2));
      });
    });

    group("update", () {
      late Person person;
      setUp(() async {
        person = factory.create(name: "test name");
        await repository.save(person);
      });
      test("basic info only", () async {
        var fixed = person.copyWith(name: "demo name", nickname: "demo nickname");
        await expectLater(repository.save(fixed), completes);
      });
      test("add and remove anniversary", () async {
        person.addAnniversary(aFactory.create(person.id, name: "new anniversary", date: DateTime(2000)));
        await expectLater(repository.save(person), completes);
        person.removeAnniversary(person.anniversaries.first.id);
        await expectLater(repository.save(person), completes);
      });
      test("add and remove contact", () async {
        person.addContact(cFactory.create(person.id, name: "new contact", method: ContactMethod.address, value: "test"));
        await expectLater(repository.save(person), completes);
        person.removeContact(person.contacts.first.id);
        await expectLater(repository.save(person), completes);
      });
    });

    test("delete", () async {
      final person = factory.create(name: "test name");
      await repository.save(person);
      await expectLater(repository.deleteByID(person.id), completes);
    });

    test("attach and remove tag test", () async {
      const tagId = "test_id";
      final person = factory.create(name: "test name");
      await repository.save(person);
      await repository.attachTags(person.id, [tagId]);
      expectLater(
          repository.getAttachedTagIDs(person.id), completion(isNotEmpty));
      await repository.removeTags(person.id, [tagId]);
      expectLater(repository.getAttachedTagIDs(person.id), completion(isEmpty));
    });
  }));
}
