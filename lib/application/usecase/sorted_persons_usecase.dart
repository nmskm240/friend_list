import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';

final sortedPersons =
    Provider.family<_SortPersonsUsecase, PersonSortOrder?>((ref, order) {
  final repository = ref.read(personRepository);
  return _SortPersonsUsecase(
    repository: repository,
    order: order ?? SharedPreferencesHelper.getPersonSortOrder(),
  );
});

class _SortPersonsUsecase {
  final IPersonRepository _repository;
  final PersonSortOrder _order;

  const _SortPersonsUsecase(
      {required IPersonRepository repository, required PersonSortOrder order})
      : _repository = repository,
        _order = order;

  Future<Iterable<Person>> call({String searchText = ""}) async {
    final searched = searchText.isEmpty
        ? await _repository.getAll()
        : await _repository.findByNameOrNickname(searchText);
    final persons = List<Person>.from(searched);
    persons.sort((a, b) => _sort(a, b));
    debugPrint(persons.toString());
    return persons;
  }

  int _sort(Person a, Person b) {
    switch (_order) {
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
