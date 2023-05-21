import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friend_list/infrastructure/person/person_factory.dart';
import 'package:friend_list/infrastructure/person/person_repository.dart';
import 'package:friend_list/presentation/common/provider/app_database_provider.dart';
import 'package:friend_list/presentation/person_list_page/person_list_page.dart';
import 'package:integration_test/integration_test.dart';

import '../unit/infrastructure/mock_database.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockDatabae mock;

  setUp(() async {
    mock = MockDatabae();
  });

  testWidgets("No one registered", (tester) async {
    final repository = PersonRepository(mock);
    await repository.deleteAll();
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWith((ref) => mock),
          ],
          child: MaterialApp(
            home: PersonListPage(),
          ),
        ),
      );
      expect(
        find.byWidgetPredicate((widget) => widget is CircularProgressIndicator),
        findsOneWidget,
      );
    });
    await tester.pumpAndSettle();
    expect(
      find.byWidgetPredicate((widget) => widget is CircularProgressIndicator),
      findsNothing,
    );
    expect(find.text("No one registered"), findsOneWidget);
  });

  testWidgets("Person info view", (tester) async {
    final factory = PersonFactory();
    final repository = PersonRepository(mock);
    await repository.deleteAll();
    final nameOnly = factory.create(name: "Demo person");
    final nameAndNickname = factory.create(name: "Demo person", nickname: "demo");
    final registeredBirthdate = factory.create(name: "Demo person");
    registeredBirthdate.addAnniversary("birthdate", DateTime(2000));
    for (final person in [nameOnly, nameAndNickname, registeredBirthdate]) {
      await repository.save(person);
    }
    await tester.runAsync(() async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appDatabaseProvider.overrideWith((ref) => mock),
          ],
          child: MaterialApp(
            home: PersonListPage(),
          ),
        ),
      );
      expect(
        find.byWidgetPredicate((widget) => widget is CircularProgressIndicator),
        findsOneWidget,
      );
    });
    await tester.pumpAndSettle();
    expect(
      find.byWidgetPredicate((widget) => widget is CircularProgressIndicator),
      findsNothing,
    );
    expect(find.text("Demo person"), findsNWidgets(3));
    expect(find.text("demo"), findsOneWidget);
    expect(
        find.text(
            "${AgeCalculator.age(registeredBirthdate.birthdate).years} years old"),
        findsOneWidget);
  });
}
