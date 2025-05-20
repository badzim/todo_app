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
      'Rappel ToDo',
      'Tu as $pendingCount tâche(s) non terminée(s)',
      details,
    );
  }

  @override
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
