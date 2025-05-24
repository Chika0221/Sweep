// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
      displayName: json['displayName'] as String,
      photoURL: json['photoURL'] as String,
      uid: json['uid'] as String,
      point: (json['point'] as num).toInt(),
      continuousCount: (json['continuousCount'] as num).toInt(),
      cumulativePoint: (json['cumulativePoint'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'uid': instance.uid,
      'point': instance.point,
      'continuousCount': instance.continuousCount,
      'cumulativePoint': instance.cumulativePoint,
    };
