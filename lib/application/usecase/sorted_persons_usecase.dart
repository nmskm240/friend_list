import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/shared_preferences/app_shared_preferences.dart';
import 'package:friend_list/infrastructure/shared_preferences/i_shared_preferences_wrapper.dart';

final sortedPersons = Provider<_SortPersonsUsecase>((ref) {
  final preferences = ref.read(sharedPreferences);
  return _SortPersonsUsecase(
    preferences: preferences,
  );
});

class _SortPersonsUsecase {
  final ISharedPreferencesWrapper preferences;

  const _SortPersonsUsecase({
    required this.preferences,
  });

  Future<Iterable<Person>> call(Iterable<Person> targets) async {
    final persons = List<Person>.from(targets);
    persons.sort((a, b) => _sort(a, b));
    return persons;
  }

  int _sort(Person a, Person b) {
    switch (preferences.getPersonSortOrder()) {
      case PersonSortOrder.added:
        if (a.createdAt == null) return -1;
        if (b.createdAt == null) return 1;
        return a.createdAt!.compareTo(b.createdAt!);
      case PersonSortOrder.age:
        if (a.age == null) return -1;
        if (b.age == null) return 1;
        return a.age!.compareTo(b.age!);
      case PersonSortOrder.name:
        return a.name.compareTo(b.name);
      default:
        throw Exception();
    }
  }
}
