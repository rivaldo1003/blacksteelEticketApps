// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class Countdown extends StatefulWidget {
//
//
//   @override
//   State<Countdown> createState() => _CountdownState();
// }
//
// class _CountdownState extends State<Countdown> {
//   Timer? countdownTimer;
//   Duration myDuration = Duration(days: 5);
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void startTimer() {
//     countdownTimer =
//         Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
//   }
//
//   void stopTimer() {
//     setState(() => countdownTimer?.cancel());
//   }
//
//   void resetTimer() {
//     stopTimer();
//     setState(() => myDuration = Duration(days: 5));
//   }
//
//   void setCountDown() {
//     final reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         countdownTimer!.cancel();
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     String strDigits(int n) => n.toString().padLeft(2, '0');
//     final days = strDigits(myDuration.inDays);
//     // Step 7
//     // final hours = strDigits(myDuration.inHours.remainder(3));
//     final minutes = strDigits(myDuration.inMinutes.remainder(10));
//     final seconds = strDigits(myDuration.inSeconds.remainder(60));
//     return Text(
//       '  00:$minutes:$seconds',
//       style: TextStyle(
//           fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
//     );
//   }
// }
