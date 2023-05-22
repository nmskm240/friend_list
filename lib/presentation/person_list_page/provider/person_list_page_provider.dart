import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/person_list_page/notifier/person_list_page_notifier.dart';
import 'package:friend_list/presentation/person_list_page/state/person_list_page_state.dart';

final personListPageProvider = StateNotifierProvider.autoDispose<
    PersonListPageNotifier, AsyncValue<PersonListPageState>>((ref) {
  return PersonListPageNotifier(ref);
});
