import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/person_edit_page/notifier/person_edit_page_notifier.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

final personEditPageProvider = StateNotifierProvider.family
    .autoDispose<PersonEditPageNotifier, PersonEditPageState, Person>(
  (ref, initialState) {
    return PersonEditPageNotifier(ref, domain: initialState);
  },
);
