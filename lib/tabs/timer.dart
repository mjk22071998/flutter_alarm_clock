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
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 90));
    super.initState();
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    return "${(count.inHours).toString().padLeft(2,"0")}:${(count.inMinutes%60).toString().padLeft(2,"0")}:${(count.inSeconds%60).toString().padLeft(2,"0")}";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                countText,
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
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
                    onPressed: () {
                      setState(() {
                        started = !started;
                      });
                      controller.reverse(
                          from:
                              (controller.value == 0) ? 1.0 : controller.value);
                    },
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
