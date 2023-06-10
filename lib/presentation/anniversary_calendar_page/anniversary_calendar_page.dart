import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/domain/person/anniversary/anniversary.dart';
import 'package:friend_list/presentation/anniversary_calendar_page/provider/anniverrsary_calendar_page_provider.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class AnniversaryCalendarPage extends ConsumerWidget {
  const AnniversaryCalendarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(anniversaryCalendarProvider);
    final notifier = ref.read(anniversaryCalendarProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("calendar"),
      ),
      body: asyncValue.when(
        error: (error, stackTrace) {
          return Text(error.toString());
        },
        loading: () {
          return const CircularProgressIndicator();
        },
        data: (state) {
          return Column(
            children: <Widget>[
              TableCalendar<Anniversary>(
                calendarFormat: state.format,
                focusedDay: state.focusedDay,
                firstDay: state.firstDay,
                lastDay: state.lastDay,
                onFormatChanged: (format) async {
                  await notifier.onFormatChanged(format);
                },
                onDaySelected: (DateTime selectedDay, DateTime focusedDay) async {
                  await notifier.onDaySelected(selectedDay, focusedDay);
                },
                selectedDayPredicate: (day) {
                  return notifier.selectedDayPredicate(day);
                },
                eventLoader: (day) {
                  return notifier.eventLoader(day).toList();
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.anniversariesOnSelectedDay.length,
                  itemBuilder: (context, index) {
                    final anniversary =
                        state.anniversariesOnSelectedDay.elementAt(index);
                    return ListTile(
                      title: Text(anniversary.name),
                      onTap: () {
                        notifier.onPressedAnniversaryListTile(anniversary);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
