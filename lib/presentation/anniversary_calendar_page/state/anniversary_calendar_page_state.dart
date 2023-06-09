import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:table_calendar/table_calendar.dart';

part 'anniversary_calendar_page_state.freezed.dart';

@freezed
class AnniversaryCalendarPageState with _$AnniversaryCalendarPageState {
  const AnniversaryCalendarPageState._();
  const factory AnniversaryCalendarPageState({
    required CalendarFormat format,
    required DateTime focusedDay,
    DateTime? selectedDay,
    @protected
    @Default(<Anniversary>[])
        List<Anniversary> thisYearAnniversaries,
  }) = _AnniversaryCalendarPageState;

  DateTime get firstDay => DateTime(focusedDay.year, 1, 1);
  DateTime get lastDay => DateTime(focusedDay.year, 12, 31);
  Map<DateTime, Iterable<Anniversary>> get anniversaryMap {
    final map = <DateTime, Iterable<Anniversary>>{};
    final dates = thisYearAnniversaries
        .map((e) => DateTime.utc(DateTime.now().year, e.date.month, e.date.day))
        .toSet();
    for (final date in dates) {
      map.putIfAbsent(date, () {
        return thisYearAnniversaries.where((element) {
          return element.date.month == date.month &&
              element.date.day == date.day;
        });
      });
    }
    return map;
  }

  Iterable<Anniversary> get anniversariesOnSelectedDay =>
      anniversaryMap[selectedDay] ?? const Iterable.empty();
}
