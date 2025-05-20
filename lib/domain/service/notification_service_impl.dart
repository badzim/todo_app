import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:todoapp/domain/port/input/notification_service.dart';

@LazySingleton(as: NotificationService, env: [Environment.prod, Environment.dev])
class NotificationServiceImpl implements NotificationService {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> init() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(initSettings);
  }

  @override
  Future<void> showTaskReminderNotification(int pendingCount) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'todo_channel',
      'ToDo Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await _plugin.show(
      0,
      tr('notification.title'),
      plural(
        'notification.pending_tasks',
        pendingCount,
        namedArgs: {'count': '$pendingCount'},
      ),
      details,
    );
  }

  @override
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
