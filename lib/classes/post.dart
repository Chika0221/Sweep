import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'post.freezed.dart';

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
  }) = _Post;

  
}

enum PostType {
  trash,
  trashCan,
}
