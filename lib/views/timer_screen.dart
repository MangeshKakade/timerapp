// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../viewmodels/timer_viewmodel.dart';
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => TimerViewModel(),
//       child: Consumer<TimerViewModel>(
//         builder: (context, viewModel, _) {
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('Timer and Stopwatch'),
//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Stopwatch: ${viewModel.timerData.stopwatchTime} seconds'),
//                   SizedBox(height: 20),
//                   if (!viewModel.isRunning)
//                     ElevatedButton(
//                       onPressed: viewModel.startStopwatch,
//                       child: Text('Start Stopwatch'),
//                     ),
//                   if (viewModel.isRunning)
//                     ElevatedButton(
//                       onPressed: viewModel.resetStopwatch,
//                       child: Text('Reset Stopwatch'),
//                     ),
//                   SizedBox(height: 40),
//                   Text('Timer: ${viewModel.timerData.remainingTime} seconds'),
//                   SizedBox(height: 10),
//                   TextField(
//                     controller: viewModel.timerController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Set Timer (seconds)'),
//                   ),
//                   SizedBox(height: 10),
//                   if (viewModel.isRunning)
//                     ElevatedButton(
//                       onPressed: () => viewModel.startTimer(context),
//                       child: Text('Start Timer'),
//                     ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
