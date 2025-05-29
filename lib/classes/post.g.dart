// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
      imagePaths:
          (json['imageURLs'] as List<dynamic>).map((e) => e as String).toList(),
      location: LatLng((json['location'] as GeoPoint).latitude,
          (json['location'] as GeoPoint).longitude),
      comment: json['comment'] as String,
      point: (json['point'] as num).toInt(),
      time: (json['time'] as Timestamp).toDate(),
      nice: (json['nice'] as num).toInt(),
      type: $enumDecode(_$PostTypeEnumMap, json['type']),
      uid: json['uid'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
      'imagePaths': instance.imagePaths,
      'location':
          GeoPoint(instance.location.latitude, instance.location.longitude),
      'comment': instance.comment,
      'point': instance.point,
      'time': Timestamp.fromDate(instance.time),
      'nice': instance.nice,
      'type': _$PostTypeEnumMap[instance.type]!,
      'uid': instance.uid,
      'postId': instance.postId,
    };

const _$PostTypeEnumMap = {
  PostType.trash: 'trash',
  PostType.trashCan: 'trashCan',
};
