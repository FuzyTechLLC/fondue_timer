import 'package:flutter/cupertino.dart';
import 'package:fondue_timer/data/TimerData.dart';

class FuzSingleton {
  static FuzSingleton _instance = FuzSingleton._internal();
  factory FuzSingleton() => _instance;
  FuzSingleton._internal();

  List<TimerData> presets = [];
}
