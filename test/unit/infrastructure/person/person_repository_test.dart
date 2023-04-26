import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/constant/contact_method.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/i_local_data_source.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';

import '../mock_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Uint8List defaultIcon;

  setUp(() async {
    final data = await rootBundle.load("assets/images/default_avatar.png");
    final buffer = data.buffer;
    defaultIcon = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  });

  group("mock database repositoy test", (() {
    final ILocalDataSource source = MockDatabae();
    late IPersonFactory factory;
    late IPersonRepository repository;
    setUp(() async {
      factory = PersonFactory();
      repository = PersonRepository(source);
      await repository.deleteAll();
    });

    test("insert", () async {
      final person = factory.create("test name", "", defaultIcon);
      await expectLater(repository.save(person), completes);
    });

    group("find", () {
      late Person person;
      setUp(() async {
        person = factory.create("demo name", "", defaultIcon);
        person.addAnniversary("new anniversary", DateTime(2000));
        person.addContact("new contact", ContactMethod.address, "test");
        person.addContact("new contact", ContactMethod.phone, "test");
        await repository.save(person);
      });
      test("with id", () async {
        final saved = await repository.findByID(person.id);
        expect(saved.anniversaries.length, equals(1));
        expect(saved.contacts.length, equals(2));
      });

      test("partical search", () async {
        final persons = [
          factory.create("test name", "test nickname", defaultIcon),
          factory.create("demo name", "demo nickname", defaultIcon),
          factory.create("name test", "nickname test", defaultIcon),
          factory.create("name demo", "nickname demo", defaultIcon),
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
        person = factory.create("test name", "", defaultIcon);
        await repository.save(person);
      });
      test("basic info only", () async {
        person.name = "demo name";
        person.nickname = "demo nickname";
        await expectLater(repository.save(person), completes);
      });
      test("add and remove anniversary", () async {
        person.addAnniversary("new anniversary", DateTime(2000));
        await expectLater(repository.save(person), completes);
        person.removeAnniversary(person.anniversaries.first.id);
        await expectLater(repository.save(person), completes);
      });
      test("add and remove contact", () async {
        person.addContact("new contact", ContactMethod.address, "test");
        await expectLater(repository.save(person), completes);
        person.removeContact(person.contacts.first.id);
        await expectLater(repository.save(person), completes);
      });
    });

    test("delete", () async {
      final person = factory.create("test name", "", defaultIcon);
      await repository.save(person);
      await expectLater(repository.deleteByID(person.id), completes);
    });

    test("attach and remove tag test", () async {
      const tagId = "test_id";
      final person = factory.create("test name", "", defaultIcon);
      await repository.save(person);
      await repository.attachTags(person.id, [tagId]);
      expectLater(
          repository.getAttachedTagIDs(person.id), completion(isNotEmpty));
      await repository.removeTags(person.id, [tagId]);
      expectLater(repository.getAttachedTagIDs(person.id), completion(isEmpty));
    });
  }));
}
