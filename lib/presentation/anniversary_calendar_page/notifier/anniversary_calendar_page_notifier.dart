import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/presentation/anniversary_calendar_page/state/anniversary_calendar_page_state.dart';
import 'package:table_calendar/table_calendar.dart';

class AnniversaryCalendarPageNotifier
    extends StateNotifier<AsyncValue<AnniversaryCalendarPageState>> {
  @protected
  final Ref ref;

  AnniversaryCalendarPageNotifier(this.ref)
      : super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    state = await AsyncValue.guard(() async {
      final repository = ref.read(personRepository);
      final list = await repository.getAllAnniversaries();
      return AnniversaryCalendarPageState(
        format: SharedPreferencesHelper.getCalendarForrmat(),
        focusedDay: DateTime.now(),
        thisYearAnniversaries: list.toList(),
      );
    });
  }

  Future<void> onFormatChanged(CalendarFormat format) async {
    SharedPreferencesHelper.setCalendartFormat(format);
    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(format: format);
    });
  }

  bool selectedDayPredicate(DateTime day) {
    return isSameDay(state.value!.selectedDay, day);
  }

  Future<void> onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    state = await AsyncValue.guard(() async {
      return state.value!.copyWith(
        selectedDay: selectedDay,
        focusedDay: focusedDay,
      );
    });
  }

  Iterable<Anniversary> eventLoader(DateTime day) {
    debugPrint(day.toString());
    return state.value!.anniversaryMap[day] ?? const Iterable.empty();
  }
}
