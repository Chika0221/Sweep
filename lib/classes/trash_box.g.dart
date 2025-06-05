// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrashBox _$TrashBoxFromJson(Map<String, dynamic> json) => _TrashBox(
  trashBoxId: json['trashBoxId'] as String,
  location: LatLng.fromJson(json['location'] as Map<String, dynamic>),
  weight: (json['weight'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$TrashBoxToJson(_TrashBox instance) => <String, dynamic>{
  'trashBoxId': instance.trashBoxId,
  'location': instance.location,
  'weight': instance.weight,
};
