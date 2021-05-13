// import 'dart:async';

import 'package:flutter/material.dart';

import 'ClkTimer.dart';

class TimerData {
  ClkTimer time;
  String name;
  Color color;

  TimerData({required this.name, required this.color, required this.time});

  String _timeParse(Duration dur) {
    int seconds = dur.inSeconds.remainder(60) + (dur.inMilliseconds.remainder(Duration.millisecondsPerSecond) > 0 ? 1 : 0);
    seconds = seconds.abs();
    String lead = seconds.toString().length < 2 ? "0" : "";
    return "${dur.isNegative && dur.inSeconds.abs() > 0 ? '-' : ''}${dur.inMinutes.abs()}:$lead$seconds";
  }

  String get remainingTimeString => _timeParse(time.remainingTime);
  String get totalTimeString => _timeParse(time.timeDur);



  set duration(Duration d) => time.duration = d;
}
