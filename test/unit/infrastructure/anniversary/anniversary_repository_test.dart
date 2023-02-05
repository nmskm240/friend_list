import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_factory.dart';
import 'package:friend_list/domain/anniversary/i_anniversary_repository.dart';
import 'package:friend_list/infrastructure/anniversary/anniversary_repository.dart';

import 'auto_increment_anniversary_factory.dart';
import '../mock_database.dart';

void main() {
  group("mock database repositoy test", (() {
    late IAnniversaryFactory factory;
    late IAnniversaryRepository repository;
    setUp(() async {
      factory = AutoIncrementAnniversaryFactory();
      repository = AnniversaryRepository(MockDatabae(enabledForeignKey: false));
      await repository.deleteAll();
    });

    test("insert", () async {
      final anniversary = factory.create("test name", DateTime.now(), "1");
      await expectLater(repository.save(anniversary), completes);
    });

    test("update", () async {
      final anniversary = factory.create("test name", DateTime.now(), "1");
      await repository.save(anniversary);
      final edited = anniversary.copyWith(name: "demo name", date: DateTime(2000,1,1));
      await expectLater(repository.save(edited), completes);
    });

    test("delete", () async {
      final anniversary = factory.create("test name", DateTime.now(), "1");
      await repository.save(anniversary);
      await expectLater(repository.deleteAllByPersonID("1"), completes);
    });
  }));
}
