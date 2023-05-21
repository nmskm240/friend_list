import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/exception/unregistered_anniversary_exception.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await SharedPreferencesHelper.loadOrDefault();
  });

  group("domain method", () {
    test("birthdate and age", () {
      final factory = PersonFactory();
      final person = factory.create(name: "test");
      expect(() => person.birthdate,
          throwsA(isA<UnregisteredAnniversaryException>()));
      expect(
          () => person.age, throwsA(isA<UnregisteredAnniversaryException>()));
      person.addAnniversary("birthdate", DateTime(2000));
      expect(person.birthdate, isNotNull);
      expect(person.age, equals(DateTime.now().year - person.birthdate.year));
    });
  });
}
