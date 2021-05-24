import 'package:flutter/cupertino.dart';
import 'package:fondue_timer/data/TimerData.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PresetData.g.dart';

@JsonSerializable()
class PresetData {
  final String name;
  final Duration duration;
  @JsonKey(name: 'color', fromJson: _intToColor, toJson: _colorToInt)
  final Color color;

  factory PresetData.fromJson(Map<String, dynamic> json) => _$PresetDataFromJson(json);
  Map<String, dynamic> toJson() => _$PresetDataToJson(this);

  PresetData(this.name, this.duration, this.color);

  String get totalTimeString => TimerData.timeParse(duration);

  static int _colorToInt(Color color) => color.value;
  static Color _intToColor(int colorInt) => Color(colorInt);
}
