import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/person_list_page/state/person_list_page_state.dart';

class PersonListPageNotifier
    extends StateNotifier<AsyncValue<PersonListPageState>> {
  @protected
  final Ref ref;

  PersonListPageNotifier(this.ref) : super(const AsyncValue.loading()) {
    _init();
  }

  @override
  void dispose() {
    state.valueOrNull?.dispose();
    super.dispose();
  }

  Future<void> _init() async {
    state = await AsyncValue.guard<PersonListPageState>(() async {
      final repository = ref.read(personRepository);
      final list = await repository.getAll();
      return PersonListPageState(
        persons: list,
        searchBarController: TextEditingController(),
      );
    });
  }

  Future<void> onChangedSearchBar(String content) async {
    final repository = ref.read(personRepository);
    state = await AsyncValue.guard(() async {
      Iterable<Person> searched;
      if(content.isEmpty) {
        searched = await repository.getAll();
      } else {
        searched = await repository.findByNameOrNickname(content);
      }
        return state.value!.copyWith(persons: searched);
    });
  }

  void onSwitchSearchMode(bool isFiltering) {
    if(!state.hasValue) {
      return;
    }
    final switched = state.value!.copyWith(isFiltering: isFiltering);
    if(!switched.isFiltering) {
      switched.searchBarController.clear();
    }
    state = AsyncValue.data(switched);
  }
}
