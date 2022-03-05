import 'dart:ui';

import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  bool started = false;

  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Text(
              "00:00:00",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text((started) ? "Pause" : "Start"),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Stop",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.tealAccent,
                      shape: const StadiumBorder(),
                      elevation: 5,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
