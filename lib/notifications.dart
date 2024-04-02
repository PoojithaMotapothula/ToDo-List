// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'dart:core';

// class Notificationservices {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   final initializationSettingsAndroid =
//       const AndroidInitializationSettings('todo');

//   void initialiseNotifications() async {
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // Request notification permissions if not granted
//     await _requestNotificationPermissions();
//   }

//   Future<void> _requestNotificationPermissions() async {
//     final status = await Permission.notification.status;
//     if (status != PermissionStatus.granted) {
//       await Permission.notification.request();
//     }
//   }

//   Future<void> showNotification(String title, String body) async {
//     var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//       'channel_id',
//       'channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//     );

//     var platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }


// }
