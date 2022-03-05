import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({Key? key}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  bool started = false;

  late AnimationController controller;

  double _progress = 0;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 00));
    super.initState();
    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          _progress = controller.value;
        });
      } else if (controller.isCompleted) {
        _progress = 0;
        started = !started;
        FlutterRingtonePlayer.playNotification();
      } else if (controller.isDismissed) {
        //Noting
      }
    });
  }

  String get countText {
    Duration count = controller.duration! * controller.value;
    return (controller.isDismissed)
        ? "${(controller.duration!.inHours).toString().padLeft(2, "0")}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, "0")}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, "0")}"
        : "${(count.inHours).toString().padLeft(2, "0")}:${(count.inMinutes % 60).toString().padLeft(2, "0")}:${(count.inSeconds % 60).toString().padLeft(2, "0")}";
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void setTime() {
    showModalBottomSheet(
      context: context,
      builder: (context) => CupertinoTimerPicker(
        initialTimerDuration: controller.duration!,
        onTimerDurationChanged: (value) {
          setState(() {
            controller.duration = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  value: _progress,
                  backgroundColor: Colors.tealAccent,
                ),
              ),
              GestureDetector(
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
            ],
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
                    onPressed: () {
                      setState(() {
                        controller.reset();
                        controller.duration = const Duration(seconds: 0);
                      });
                    },
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
