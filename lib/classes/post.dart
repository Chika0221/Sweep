import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required List<String> imagePaths,
    required LatLng location,
    required String comment,
    required int point,
    required DateTime time,
    required int nice,
    required PostType type,
    required String uid,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) =>_$PostFromJson(json);
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
  
}

enum PostType {
  trash,
  trashCan,
}
