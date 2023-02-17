import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/exception/unregistered_birthdate_exception.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';

void main() {
  group("domain method", () {
    test("birthdate and age", () {
      final factory = PersonFactory();
      final person = factory.create("test");
      expect(() => person.birthdate, throwsA(isA<UnregisteredBirthdateException>()));
      expect(() => person.age, throwsA(isA<UnregisteredBirthdateException>()));
      person.addAnniversary("birthdate", DateTime(2000));
      expect(person.birthdate, isNotNull);
      expect(person.age, equals(DateTime.now().year - person.birthdate.year));
    });
  });
}
