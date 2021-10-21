import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// int createUniqueId(){
//   return DateTime.now().microsecondsSinceEpoch.remainder(10000);
// }

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        '1', 'basic_channel',importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
  static Future showNotifications({
    int id =0,
    String? title,
    String? body,
    String? payload,
  }) async => await _notifications.show(id,
    title,
    body,
    await _notificationDetails(),
    payload: payload,
  );
}
