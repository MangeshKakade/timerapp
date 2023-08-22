import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer and Stopwatch App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isStopwatchRunning = false;
  bool isTimerRunning = false;
  int stopwatchTime = 0;
  int initialTimerValue = 10;
  int remainingTime = 10;
  late TextEditingController timerController;
  Timer? activeStopwatch;
  Timer? activeTimer;

  @override
  void initState() {
    super.initState();
    timerController = TextEditingController(text: initialTimerValue.toString());
  }

  void startStopwatch() {
    setState(() {
      isStopwatchRunning = true;
      activeStopwatch?.cancel();
      activeTimer?.cancel();
      isTimerRunning = false;
    });

    activeStopwatch = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        stopwatchTime++;
      });
    });
  }

  void resetStopwatch() {
    setState(() {
      stopwatchTime = 0;
      isStopwatchRunning = false;
      activeStopwatch?.cancel();
      activeTimer?.cancel();
      isTimerRunning = false;
    });
  }

  void startTimer() {
    setState(() {
      isTimerRunning = true;
      remainingTime = int.parse(timerController.text);
      activeTimer?.cancel();
      activeStopwatch?.cancel();
      isStopwatchRunning = false;
    });

    activeTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
          isTimerRunning = false;
          showTimerExpiredPopup(context);
        }
      });
    });
  }

  void showTimerExpiredPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Timer Expired'),
          content: Text('The timer has reached 00:00:00.'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    activeStopwatch?.cancel();
    activeTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer and Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Stopwatch: $stopwatchTime seconds'),
            SizedBox(height: 20),
            if (!isStopwatchRunning)
              ElevatedButton(
                onPressed: startStopwatch,
                child: Text('Start Stopwatch'),
              ),
            if (isStopwatchRunning)
              ElevatedButton(
                onPressed: resetStopwatch,
                child: Text('Reset Stopwatch'),
              ),
            SizedBox(height: 40),
            Text('Timer: $remainingTime seconds'),
            SizedBox(height: 10),
            TextField(
              controller: timerController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Set Timer (seconds)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: isTimerRunning ? null : startTimer,
              child: Text('Start Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
