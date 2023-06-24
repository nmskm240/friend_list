import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:friend_list/infrastructure/local_notification/i_notification_scheduler.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:uuid/uuid.dart';

/// ローカル通知サービス
///
/// 現状Androidのみ対応
class LocalNotificationScheduler
    implements INotificationScheduler<PendingNotificationRequest> {
  @protected
  final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {
    const settings = InitializationSettings(
        android: AndroidInitializationSettings("notification_icon"));
    final timezone = await FlutterNativeTimezone.getLocalTimezone();
    initializeTimeZones();
    setLocalLocation(getLocation(timezone));
    await localNotificationsPlugin.initialize(settings);
  }

  /// 即時通知
  Future<void> show(String title, String body) async {
    localNotificationsPlugin.show(
      DateTime.timestamp().microsecondsSinceEpoch,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          const Uuid().v1(),
          "テスト",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }

  /// スケジュールを設定
  @override
  Future<int> setSchedule(
    String title,
    String body,
    int month,
    int day,
  ) async {
    final time = SharedPreferencesHelper.getNotificationTime();
    final now = DateTime.now();
    final year =
        now.isBefore(DateTime(now.year, month, day)) ? now.year : now.year + 1;
    final zonedScheduleDate = TZDateTime(
      local,
      year,
      month,
      day,
      time.hour,
      time.minute,
    );
    if (now.isAfter(zonedScheduleDate)) {
      return -1;
    }
    final id = DateTime.timestamp().hashCode;
    await localNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      zonedScheduleDate,
      NotificationDetails(
        android: AndroidNotificationDetails(
          const Uuid().v1(),
          "テスト",
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
    return id;
  }

  @override
  Future<void> cancelSchedule(int id) async {
    await localNotificationsPlugin.cancel(id);
  }

  @override
  Future<void> cancelScheduleAll() async {
    await localNotificationsPlugin.cancelAll();
  }

  @override
  Future<Iterable<PendingNotificationRequest>> getScheduledAll() async {
    return await localNotificationsPlugin.pendingNotificationRequests();
  }

  @override
  Future<Iterable<PendingNotificationRequest>> getSchedules(
      Iterable<int> ids) async {
    final list = await localNotificationsPlugin.pendingNotificationRequests();
    return list.where((element) => ids.contains(element.id));
  }

  @override
  Future<bool> isScheduled(int id) async {
    final list = await localNotificationsPlugin.pendingNotificationRequests();
    return list.any((e) => e.id == id);
  }
}
