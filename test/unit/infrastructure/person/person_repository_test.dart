import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/person/i_person_factory.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';

import 'auto_increment_person_factory.dart';
import '../mock_database.dart';

void main() {
  group("mock database repositoy test", (() {
    late IPersonFactory factory;
    late IPersonRepository repository;
    setUp(() async {
      factory = AutoIncrementPersonFactory();
      repository = PersonRepository(MockDatabae(enabledForeignKey: false));
      await repository.deleteAll();
    });

    test("insert", () async {
      final person = factory.create("test name");
      await expectLater(repository.save(person), completes);
    });

    test("update", () async {
      final person = factory.create("test name");
      await repository.save(person);
      final edited = person.copyWith(name: "demo name", nickname: "demo value");
      await expectLater(repository.save(edited), completes);
    });

    test("delete", () async {
      final person = factory.create("test name");
      await repository.save(person);
      await expectLater(repository.deleteByID(person.id), completes);
    });

    test("partical search", () async {
      final persons = [
        factory.create("test name", nickname: "test nickname"),
        factory.create("demo name", nickname: "demo nickname"),
        factory.create("name test", nickname: "nickname test"),
        factory.create("name demo", nickname: "nickname demo"),
      ];
      for (final person in persons) {
        await repository.save(person);
      }
      final searched =
          await repository.findByNameOrNickname("tes", isParticalMatch: true);
      expect(searched.length, equals(2));
    });

    test("attach and remove tag test", () async {
      const tagId = "test_id";
      final person = factory.create("test name");
      await repository.save(person);
      await repository.attachTags(person.id, [tagId]);
      expectLater(
          repository.getAttachedTagIDs(person.id), completion(isNotEmpty));
      await repository.removeTags(person.id, [tagId]);
      expectLater(repository.getAttachedTagIDs(person.id), completion(isEmpty));
    });
  }));
}
