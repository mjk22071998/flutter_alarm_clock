import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late String _date, _time;

  _ClockState() {
    DateTime dateTime = DateTime.now();
    _date = DateFormat("EEEE, dd-MM-yyyy").format(dateTime);
    _time = DateFormat("hh:mm:ss a").format(dateTime);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime(timer);
    });
  }

  void setTime(Timer t) {
    setState(() {
      DateTime dateTime = DateTime.now();
      _date = DateFormat("EEEE, dd-MM-yyyy").format(dateTime);
      _time = DateFormat("hh:mm:ss a").format(dateTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _time,
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _date,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
