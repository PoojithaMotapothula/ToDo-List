// import 'package:flutter/material.dart';
// import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Alarm & Stopwatch',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final AlarmClockController _alarmController = AlarmClockController();
//   Stopwatch _stopwatch = Stopwatch();
//   bool _isRunning = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Alarm & Stopwatch'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 _setAlarm();
//               },
//               child: Text('Set Alarm'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 _toggleStopwatch();
//               },
//               child: Text(_isRunning ? 'Stop Stopwatch' : 'Start Stopwatch'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Stopwatch: ${_stopwatch.elapsed.inSeconds} seconds',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _setAlarm() {
//     final DateTime now = DateTime.now();
//     final DateTime alarmTime = now.add(Duration(seconds: 10));

//     _alarmController.show(
//       context: context,
//       time: alarmTime,
//       sound: true,
//       duration: Duration(seconds: 10),
//       onStart: () {
//         Fluttertoast.showToast(msg: 'Alarm started!');
//       },
//       onFinished: () {
//         Fluttertoast.showToast(msg: 'Alarm finished!');
//       },
//     );
//   }

//   void _toggleStopwatch() {
//     if (_isRunning) {
//       _stopwatch.stop();
//     } else {
//       _stopwatch.start();
//     }

//     setState(() {
//       _isRunning = !_isRunning;
//     });
//   }
// }
