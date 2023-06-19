import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friend_list/common/shared_preferences_helper.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'package:uuid/uuid.dart';

final localNotificationServiceProvider =
    Provider<LocalNotificationService>((ref) {
  throw UnimplementedError();
});

/// ローカル通知サービス
///
/// 現状Androidのみ対応
class LocalNotificationService {
  @protected
  final localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const settings = InitializationSettings(
        android: AndroidInitializationSettings("notification_icon"));
    final timezone = await FlutterNativeTimezone.getLocalTimezone();
    initializeTimeZones();
    setLocalLocation(getLocation(timezone));
    await localNotificationsPlugin.initialize(settings);
  }

  /// 即時通知
  Future<void> show(int id, String title, String body) async {
    localNotificationsPlugin.show(
      id,
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
  Future<void> setSchedule(
    int id,
    String title,
    String body,
    int month,
    int day,
  ) async {
    final time = SharedPreferencesHelper.getNotificationTime();
    final zonedScheduleDate = TZDateTime(
      local,
      DateTime.now().year,
      month,
      day,
      time.hour,
      time.minute,
    );
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
  }

  Future<void> cancelSchedule(int id) async {
    await localNotificationsPlugin.cancel(id);
  }

  Future<void> cnacelAllScheduled() async {
    await localNotificationsPlugin.cancelAll();
  }

  Future<Iterable<PendingNotificationRequest>> getScheduledAll() async {
    return await localNotificationsPlugin.pendingNotificationRequests();
  }

  Future<Iterable<PendingNotificationRequest>> getScheduled(Iterable<int> ids) async {
    final list = await localNotificationsPlugin.pendingNotificationRequests();
    return list.where((element) => ids.contains(element.id));
  }

  Future<bool> isScheduled(int id) async {
    final list = await localNotificationsPlugin.pendingNotificationRequests();
    return list.any((e) => e.id == id);
  }
}
