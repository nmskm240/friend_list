import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/person.dart';

final sortedPersons = Provider<_SortPersonsUsecase>((ref) {
  return const _SortPersonsUsecase();
});

class _SortPersonsUsecase {
  const _SortPersonsUsecase();

  Future<Iterable<Person>> call(Iterable<Person> targets) async {
    final persons = List<Person>.from(targets);
    persons.sort((a, b) => _sort(a, b));
    return persons;
  }

  int _sort(Person a, Person b) {
    switch (SharedPreferencesHelper.getPersonSortOrder()) {
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