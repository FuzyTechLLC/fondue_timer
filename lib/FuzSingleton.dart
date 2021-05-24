import 'dart:convert';
import 'package:fondue_timer/data/PresetData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FuzSingleton {
  static FuzSingleton _instance = FuzSingleton._internal();
  factory FuzSingleton() => _instance;
  FuzSingleton._internal();

  static const PRESETS_KEY = "PRESETS";
  List<PresetData> presets = [];

  Future savePresets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> presetStrings = presets.map((p) => jsonEncode(p.toJson())).toList();
    prefs.setStringList(PRESETS_KEY, presetStrings);
  }

  Future loadPresets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> presetStrings = (prefs.getStringList(PRESETS_KEY) ?? []);
    presets = presetStrings.map((v) => PresetData.fromJson(jsonDecode(v))).toList();
  }
}
