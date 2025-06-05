// Package imports:
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
    required String postId,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @override
  // TODO: implement comment
  String get comment => throw UnimplementedError();

  @override
  // TODO: implement imagePaths
  List<String> get imagePaths => throw UnimplementedError();

  @override
  // TODO: implement location
  LatLng get location => throw UnimplementedError();

  @override
  // TODO: implement nice
  int get nice => throw UnimplementedError();

  @override
  // TODO: implement point
  int get point => throw UnimplementedError();

  @override
  // TODO: implement postId
  String get postId => throw UnimplementedError();

  @override
  // TODO: implement time
  DateTime get time => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement type
  PostType get type => throw UnimplementedError();

  @override
  // TODO: implement uid
  String get uid => throw UnimplementedError();
}

enum PostType {
  trash(displayName: "ゴミ"),
  trashCan(displayName: "ゴミ箱"),
  trashBox(displayName: "スマートゴミ箱");

  const PostType({required this.displayName});

  final String displayName;
}
