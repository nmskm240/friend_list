import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/usecase/filtered_persons_usecase.dart';
import 'package:friend_list/application/usecase/sorted_persons_usecase.dart';
import 'package:friend_list/common/constant/person_sort_order.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/infrastructure/local_database/person/person_factory.dart';
import 'package:friend_list/infrastructure/shared_preferences/app_shared_preferences.dart';
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
      final filtered = await ref.read(filteredPersons).call("");
      final sorted = await ref.read(sortedPersons).call(filtered);
      final sortOrder = ref.read(sharedPreferences).getPersonSortOrder();
      return PersonListPageState(
        persons: sorted,
        searchBarController: TextEditingController(),
        sortOrder: sortOrder,
      );
    });
  }

  Future<void> onPressedAddPerson() async {
    final factory = PersonFactory(ref.read(sharedPreferences).getDefaultIcon());
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
    state = await AsyncValue.guard(() async {
      final filtered = await ref.read(filteredPersons).call(content);
      final sorted = await ref.read(sortedPersons).call(filtered);
      return state.value!.copyWith(persons: sorted);
    });
  }

  Future<void> onSwitchSearchMode(bool isFiltering) async {
    if (!state.hasValue) {
      return;
    }
    state = await AsyncValue.guard(() async {
      var list = state.valueOrNull?.persons ?? [];
      if (!isFiltering) {
        final filtered = await ref.read(filteredPersons).call("");
        list = await ref.read(sortedPersons).call(filtered);
      }
      return state.value!.copyWith(isFiltering: isFiltering, persons: list);
    });
  }

  Future<void> onChangedSortOrder(PersonSortOrder order) async {
    ref.read(sharedPreferences).setPersonSortOrder(order);
    state = await AsyncValue.guard(() async {
      final sorted = await ref.read(sortedPersons).call(state.value!.persons);
      return state.value!.copyWith(persons: sorted, sortOrder: order);
    });
  }
}
