// // ignore_for_file: prefer_const_declarations

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize the local notification plugin
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Configure the initialization settings for the plugin
//   final InitializationSettings initializationSettings =
//       const InitializationSettings(
//     android: AndroidInitializationSettings('todo'), // Replace with your app's launcher icon
//     // iOS: IOSInitializationSettings(),
//   );

//   // Initialize the plugin with the initialization settings
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//   );


//   Future<void> _scheduleNotification() async {
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     'your_channel_id', 
//     'your_channel_name', 
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//   );

//   var scheduledTime = DateTime.now().add(const Duration(seconds: 10));

//   await flutterLocalNotificationsPlugin.zonedSchedule(
//     0,
//     'Scheduled Notification Title',
//     'Scheduled Notification Body',
//     scheduledTime,
//     platformChannelSpecifics,
//     // androidAllowWhileIdle: true,
//     uiLocalNotificationDateInterpretation:
//         UILocalNotificationDateInterpretation.absoluteTime,
//   );k
// }

// }
