// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Discard _$DiscardFromJson(Map<String, dynamic> json) => _Discard(
      discardId: json['DiscardId'] as String,
      time: (json['time'] as Timestamp).toDate(),
      weight: (json['weight'] as num).toInt(),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$DiscardToJson(_Discard instance) => <String, dynamic>{
      'DiscardId': instance.discardId,
      'time': Timestamp.fromDate(instance.time),
      'weight': instance.weight,
      'uid': instance.uid,
    };
