import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/local_database/person/person_factory.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_list_page/provider/person_list_page_provider.dart';
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

  Future<void> onPressedAddPerson() async {
    final factory = PersonFactory();
    final person = factory.create();
    final route = PersonEditRoute(person: person);
    final res = await ref.read(router).push<Person>(route);
    if (res == null) {
      return;
    }
    state = ref.refresh(personListPageProvider);
  }

  Future<void> onPressedPersonListTile(Person person) async {
    final route = PersonDetailRoute(person: person);
    ref.read(router).push(route);
  }

  Future<void> onChangedSearchBar(String content) async {
    final repository = ref.read(personRepository);
    state = await AsyncValue.guard(() async {
      Iterable<Person> searched;
      if (content.isEmpty) {
        searched = await repository.getAll();
      } else {
        searched = await repository.findByNameOrNickname(content);
      }
      return state.value!.copyWith(persons: searched);
    });
  }

  Future<void> onSwitchSearchMode(bool isFiltering) async {
    if (!state.hasValue) {
      return;
    }
    state = await AsyncValue.guard(() async {
      var list = state.valueOrNull?.persons ?? [];
      if (!isFiltering) {
        final repository = ref.read(personRepository);
        state.value!.searchBarController.clear();
        list = await repository.getAll();
      }
      return state.value!.copyWith(isFiltering: isFiltering, persons: list);
    });
  }
}
