// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PresetData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresetData _$PresetDataFromJson(Map<String, dynamic> json) {
  return PresetData(
    json['name'] as String,
    Duration(microseconds: json['duration'] as int),
    PresetData._intToColor(json['color'] as int),
  );
}

Map<String, dynamic> _$PresetDataToJson(PresetData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'duration': instance.duration.inMicroseconds,
      'color': PresetData._colorToInt(instance.color),
    };
