import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/application/provider/navigation_service_provider.dart';
import 'package:friend_list/application/provider/person_service_provider.dart';
import 'package:friend_list/presentation/person_detail_page/notifier/person_detail_page_notifier.dart';
import 'package:friend_list/presentation/person_detail_page/state/person_detail_page_state.dart';

final personDetailPageProvider = StateNotifierProvider.autoDispose
    .family<PersonDetailPageNotifier, AsyncValue<PersonDetailPageState>, String>(
        (ref, id) {
  return PersonDetailPageNotifier(
      service: ref.read(personServiceProvider),
      navigator: ref.read(navigationServiceProvider),
      id: id);
});
