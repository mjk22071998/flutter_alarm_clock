import 'dart:async';

import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int seconds = 0, minutes = 0, hours = 0;
  String digitSeconds = "00", digitMinutes = "00", digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();
    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;
      digitHours = "00";
      digitMinutes = "00";
      digitSeconds = "00";
      laps.clear();
      started = false;
    });
  }

  void addLaps() {
    String lap = "$digitHours:$digitMinutes:$digitSeconds";
    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;
      if (localSeconds > 59) {
        localMinutes++;
        localSeconds = 0;
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              "$digitHours:$digitMinutes:$digitSeconds",
              style:
                  const TextStyle(fontSize: 82.0, fontWeight: FontWeight.w600),
            )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.teal, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                      itemCount: laps.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Lap No. " + (index + 1).toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                laps[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          (started) ? stop() : start();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text((started) ? "Pause" : "Start"),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 5,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    addLaps();
                  },
                  icon: const Icon(Icons.flag),
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          reset();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Reset",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            elevation: 5,
                            primary: Colors.tealAccent),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
