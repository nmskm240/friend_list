import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}
