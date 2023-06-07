import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/anniversary_edit_page/notifier/anniversary_edit_page_notifier.dart';
import 'package:friend_list/presentation/anniversary_edit_page/provider/anniversary_edit_page_provider_parameter.dart';
import 'package:friend_list/presentation/anniversary_edit_page/state/anniversary_edit_page_state.dart';

final anniversaryeditPageProvider = StateNotifierProvider.family.autoDispose<
    AnniversaryEditPageNotifier, AnniversaryEditPageState, AnniversaryEditPageProviderParameter>((ref, param) {
  return AnniversaryEditPageNotifier(ref, param.person, param.anniversary);
});
