import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/navigation_service_provider.dart';
import 'package:friend_list/application/provider/person_service_provider.dart';
import 'package:friend_list/presentation/person_edit_page/notifier/person_edit_page_notifier.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

final personEditPageProvider = StateNotifierProvider.autoDispose.family<
    PersonEditPageNotifier, AsyncValue<PersonEditPageState>, String?>((ref, id) {
  return PersonEditPageNotifier(
    service: ref.read(personServiceProvider),
    navigator: ref.read(navigationServiceProvider),
    id: id,
  );
});
