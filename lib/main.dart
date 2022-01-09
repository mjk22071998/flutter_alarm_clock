import 'package:alarm_clock/tabs/alarm.dart';
import 'package:alarm_clock/tabs/clock.dart';
import 'package:alarm_clock/tabs/stopwatch.dart';
import 'package:alarm_clock/tabs/timer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Decent Alarm Clock",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.light(
          primary: Colors.teal,
          primaryVariant: Colors.teal.shade900,
          secondary: Colors.tealAccent,
          secondaryVariant: Colors.tealAccent.shade700,
        ),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Decent Alarm Clock"),
              centerTitle: true,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    child: Text(
                      "Clock",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.access_time),
                  ),
                  Tab(
                    child: Text(
                      "Alarm",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.access_alarm),
                  ),
                  Tab(
                    child: Text(
                      "Stopwatch",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.av_timer),
                  ),
                  Tab(
                    child: Text(
                      "Countdown Timer",
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(Icons.timer_rounded),
                  )
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Clock(),
                Alarm(),
                StopWatch(),
                CountdownTimer(),
              ],
            )),
      ),
    );
  }
}
