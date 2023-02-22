import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/common/exception/unregistered_birthdate_exception.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Uint8List defaultIcon;

  setUp(() async {
    final data = await rootBundle.load("assets/images/default_avatar.png");
    final buffer = data.buffer;
    defaultIcon = buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  });

  group("domain method", () {
    test("birthdate and age", () {
      final factory = PersonFactory();
      final person = factory.create("test", "", defaultIcon);
      expect(() => person.birthdate,
          throwsA(isA<UnregisteredBirthdateException>()));
      expect(() => person.age, throwsA(isA<UnregisteredBirthdateException>()));
      person.addAnniversary("birthdate", DateTime(2000));
      expect(person.birthdate, isNotNull);
      expect(person.age, equals(DateTime.now().year - person.birthdate.year));
    });
  });
}
