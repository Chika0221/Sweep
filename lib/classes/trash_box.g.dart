// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrashBox _$TrashBoxFromJson(Map<String, dynamic> json) => _TrashBox(
      name: json['name'] as String,
      trashBoxId: json['trashBoxId'] as String,
      location: LatLng(
        (json['location'] as GeoPoint).latitude,
        (json['location'] as GeoPoint).longitude,
      ),
      maxWeight: (json['maxWeight'] as num).toInt(),
      weight: (json['weight'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$TrashBoxToJson(_TrashBox instance) => <String, dynamic>{
      'name': instance.name,
      'trashBoxId': instance.trashBoxId,
      'location': instance.location,
      'maxWeight': instance.maxWeight,
      'weight': instance.weight,
    };
