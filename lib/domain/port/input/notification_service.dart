import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

abstract class NotificationService {
  Future<void> init();
  Future<void> showTaskReminderNotification(int pendingCount);
  Future<void> cancelAll();
}
