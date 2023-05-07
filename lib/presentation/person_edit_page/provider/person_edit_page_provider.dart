import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/person_service_provider.dart';
import 'package:friend_list/domain/person/person.dart';
import 'package:friend_list/presentation/app_router.dart';
import 'package:friend_list/presentation/person_edit_page/notifier/person_edit_page_notifier.dart';
import 'package:friend_list/presentation/person_edit_page/state/person_edit_page_state.dart';

final personEditPageProvider = StateNotifierProvider.autoDispose.family<
    PersonEditPageNotifier, PersonEditPageState, Person?>((ref, domain) {
  return PersonEditPageNotifier(
    service: ref.read(personServiceProvider),
    router: ref.read(routerProvider),
    domain: domain,
  );
});
