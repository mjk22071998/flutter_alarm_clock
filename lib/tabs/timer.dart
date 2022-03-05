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

  int _hours = 0, _minutes = 0, _seconds = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration:
            Duration(seconds: _seconds, minutes: _minutes, hours: _hours));
    super.initState();
  }

  String get countText {
    return "${(_hours).toString().padLeft(2, "0")}:${(_minutes).toString().padLeft(2, "0")}:${(_seconds).toString().padLeft(2, "0")}";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setTime() async {
    TimeOfDay? timeOfDay= await showTimePicker(
                    context: context,
                    initialTime: const TimeOfDay(hour: 00, minute: 00));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: GestureDetector(
              onTap: () {
                setTime();
              },
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
                      if (started) {
                        controller.stop(canceled: true);
                      } else {
                        controller.reverse(
                            from: (controller.value == 0)
                                ? 1.0
                                : controller.value);
                      }
                      setState(() {
                        started = !started;
                      });
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
