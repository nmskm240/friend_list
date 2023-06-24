import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationScheduler = Provider<INotificationScheduler>((ref) {
  throw UnimplementedError();
});

abstract class INotificationScheduler<T> {
  Future<void> init();
  Future<int> setSchedule(
    String title,
    String body,
    int month,
    int day,
    TimeOfDay time,
  );
  Future<void> cancelSchedule(int id);
  Future<void> cancelScheduleAll();
  Future<Iterable<T>> getSchedules(Iterable<int> ids);
  Future<Iterable<T>> getScheduledAll();
  Future<bool> isScheduled(int id);
}
