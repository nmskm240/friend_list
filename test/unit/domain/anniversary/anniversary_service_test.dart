import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/anniversary/anniversary.dart';
import 'package:friend_list/domain/anniversary/anniversary_service.dart';

import '../../infrastructure/anniversary/auto_increment_anniversary_factory.dart';
import '../../infrastructure/anniversary/in_memoty_anniversary_repository.dart';

void main() {
  group("is duplicated test", () {
    late AnniversaryService service;
    late Anniversary registred;
    setUp(() {
      final factory = AutoIncrementAnniversaryFactory();
      registred = factory.create("Test anniversary", DateTime.now(), "Person id");
      final repository = InMemoryAnniversaryRepository([
        registred,
      ]);
      service = AnniversaryService(factory, repository);
    });

    test("All match", () async {
      final anniversary = registred.copyWith();
      expect(await service.isDuplicated(anniversary), isTrue);
    });

    test("Same date", () async {
      final someDay = registred.copyWith(name: "Some date");
      expect(await service.isDuplicated(someDay), isFalse);
    });

    test("Same name", () async {
      final someName = registred.copyWith(date: DateTime.now());
      expect(await service.isDuplicated(someName), isTrue);
    });

    test("Other person id", () async {
      final other = registred.copyWith(personId: "other");
      expect(await service.isDuplicated(other), isFalse);
    });
  });
}
