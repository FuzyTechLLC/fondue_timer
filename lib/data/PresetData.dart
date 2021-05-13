import 'package:flutter/cupertino.dart';
import 'package:fondue_timer/data/TimerData.dart';

class PresetData {
  final String name;
  final Duration duration;
  final Color color;

  PresetData(this.name, this.duration, this.color);

  String get totalTimeString => TimerData.timeParse(duration);

}
