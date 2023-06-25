import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/person_detail_page/notifier/person_detail_page_notifier.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

final personDetailPage = StateNotifierProvider
    .family<PersonDetailPageNotifier, PersonDetailPageState, Person>(
        (ref, initialState) {
  return PersonDetailPageNotifier(ref: ref, person: initialState);
});
