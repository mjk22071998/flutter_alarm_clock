import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void dispose() {
    _stopWatchTimer.dispose();
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
            const Center(
                child: Text(
              "00:00:00",
              style: TextStyle(fontSize: 82.0, fontWeight: FontWeight.w600),
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
                    child: const Center(
                      child: Text(
                        "Laps appear here Here",
                        style: TextStyle(color: Colors.black),
                      ),
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
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Start"),
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
                  onPressed: () {},
                  icon: const Icon(Icons.flag),
                  color: Colors.black,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Stop",
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
