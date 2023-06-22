import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/domain/person/i_person_repository.dart';
import 'package:friend_list/infrastructure/local_notification/i_notification_scheduler.dart';

final resetNotificationSchedule = Provider((ref) {
  final repository = ref.read(personRepository);
  final scheduler = ref.read(notificationScheduler);
  return ResetNotificationScheduleUsecase(
    repository: repository,
    scheduler: scheduler,
  );
});

class _ResetNotificationScheduleUsecaseDto {
  final String title;
  final String body;
  final DateTime notificationTime;
  final Uint8List icon;

  const _ResetNotificationScheduleUsecaseDto({
    required this.title,
    required this.body,
    required this.notificationTime,
    required this.icon,
  });
}

class ResetNotificationScheduleUsecase {
  final IPersonRepository repository;
  final INotificationScheduler scheduler;

  const ResetNotificationScheduleUsecase({
    required this.repository,
    required this.scheduler,
  });

  Future<void> call() async {
    await scheduler.cancelScheduleAll();
    final persons = await repository.getAll();
    final schedules = persons.expand((person) {
      return person.anniversaries.expand((anniversary) {
        return anniversary.reminds.map((remind) {
          final duration = Duration(days: remind.timing);
          final date = anniversary.date.subtract(duration);
          return _ResetNotificationScheduleUsecaseDto(
            title: "リマインド",
            body: anniversary.name,
            notificationTime: date,
            icon: person.icon,
          );
        });
      });
    });
    for (final schedule in schedules) {
      await scheduler.setSchedule(
        schedule.title,
        schedule.body,
        schedule.notificationTime.month,
        schedule.notificationTime.day,
      );
    }
  }
}
