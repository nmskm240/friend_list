import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/tag/i_tag_factory.dart';
import 'package:friend_list/domain/tag/i_tag_repository.dart';
import 'package:friend_list/infrastructure/tag/tag_repository.dart';

import '../mock_database.dart';
import 'auto_increment_tag_factory.dart';

void main() {
  group("mock database repositoy test", (() {
    late ITagFactory factory;
    late ITagRepository repository;
    setUp(() async {
      factory = AutoIncrementTagFactory();
      repository = TagRepository(MockDatabae(enabledForeignKey: false));
      await repository.deleteAll();
    });

    test("insert", () async {
      final tag = factory.create("test name");
      await expectLater(repository.save(tag), completes);
    });

    test("update", () async {
      final tag = factory.create("test name");
      await repository.save(tag);
      final edited = tag.copyWith(name: "demo name");
      await expectLater(repository.save(edited), completes);
    });

    test("delete", () async {
      final tag = factory.create("test name");
      await repository.save(tag);
      await expectLater(repository.deleteByID(tag.id), completes);
    });
  }));
}
