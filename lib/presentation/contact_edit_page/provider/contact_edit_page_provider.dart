import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/contact_edit_page/notifier/contact_edit_page_notifier.dart';
import 'package:friend_list/presentation/contact_edit_page/provider/contact_edit_page_provider_parameter.dart';
import 'package:friend_list/presentation/contact_edit_page/state/contact_edit_page_state.dart';

final contactEditPageProvider = StateNotifierProvider.family.autoDispose<
    ContactEditPageNotifier,
    ContactEditPageState,
    ContactEditPageProviderParameter>((ref, param) {
  return ContactEditPageNotifier(ref, param.person, param.contact);
});
