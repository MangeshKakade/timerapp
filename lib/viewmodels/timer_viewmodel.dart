// // viewmodels/timer_view_model.dart
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../models/timer_model.dart';
//
// class TimerViewModel extends ChangeNotifier {
//   bool isRunning = false;
//   int stopwatchTime = 0; // in seconds
//   int initialTimerValue = 10; // in seconds
//   int remainingTime = 10; // in seconds
//   late TextEditingController timerController;
//   Timer? activeTimer; // Store the reference to the active timer
//
//
//   @override
//   void initState() {
//     super.initState();
//     timerController = TextEditingController(text: initialTimerValue.toString());
//   }
//
//
//
//   void startStopwatch() {
//     setState(() {
//       isRunning = true;
//       activeTimer?.cancel(); // Cancel any active timer before starting the stopwatch
//     });
//
//     activeTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       setState(() {
//         stopwatchTime++;
//       });
//     });
//   }
//
//   void resetStopwatch() {
//     // Your existing reset stopwatch logic
//   }
//
//   void startTimer(BuildContext context) {
//     // Your existing start timer logic
//   }
//
//   void showTimerExpiredPopup(BuildContext context) {
//     // Your existing show popup logic
//   }
//
//   // Dispose method
//   void dispose() {
//     activeTimer?.cancel();
//     super.dispose();
//   }
// }
