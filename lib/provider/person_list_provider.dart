import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/entity/person.dart';
import 'package:friend_list/repository/person_repository_by_local_database.dart';
import 'package:friend_list/view_model/person_list_view_model.dart';

final personListProvider =
    StateNotifierProvider<PersonListViewModel, AsyncValue<List<Person>>>(
  (ref) {
    return PersonListViewModel(PersonRepositoryByLocalDatbase());
  },
);