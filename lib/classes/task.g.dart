// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  name: json['name'] as String,
  point: (json['point'] as num?)?.toInt() ?? 1,
  isComplete: json['isComplete'] as bool? ?? false,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'name': instance.name,
  'point': instance.point,
  'isComplete': instance.isComplete,
};
