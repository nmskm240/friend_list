import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/tag/tag.dart';
import 'package:friend_list/domain/tag/tag_service.dart';

import '../../infrastructure/tag/auto_increment_tag_factory.dart';
import '../../infrastructure/tag/in_memory_tag_repository.dart';

void main() {
  group("is duplicated test", () {
    late TagService service;
    late Tag registred;
    setUp(() {
      final factory = AutoIncrementTagFactory();
      registred = factory.create("Test contact");
      final repository = InMemoryTagRepository([
        registred,
      ]);
      service = TagService(factory, repository);
    });

    test("Same name", () async {
      final tag = registred.copyWith(id: "other");
      expect(await service.isDuplicated(tag), isTrue);
    });
  });
}
