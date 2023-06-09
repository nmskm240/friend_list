import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/presentation/anniversary_calendar_page/notifier/anniversary_calendar_page_notifier.dart';
import 'package:friend_list/presentation/anniversary_calendar_page/state/anniversary_calendar_page_state.dart';

final anniversaryCalendarProvider = StateNotifierProvider<AnniversaryCalendarPageNotifier, AsyncValue<AnniversaryCalendarPageState>>((ref) {
  return AnniversaryCalendarPageNotifier(ref);
});