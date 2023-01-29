import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/repository/person_repository.dart';

class PersonListViewModel extends StateNotifier<AsyncValue<List<Person>>> {
  final PersonRepository _repository;

  PersonListViewModel(this._repository) : super(const AsyncValue.loading()) {
    load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final persons = await _repository.getAll();
      return persons.toList();
    });
  }
}
