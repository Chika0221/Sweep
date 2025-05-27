// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {
  List<String> get imagePaths;
  LatLng get location;
  String get comment;
  int get point;
  DateTime get time;
  int get nice;
  PostType get type;
  String get uid;
  String get postId;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostCopyWith<Post> get copyWith =>
      _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Post &&
            const DeepCollectionEquality()
                .equals(other.imagePaths, imagePaths) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.nice, nice) || other.nice == nice) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imagePaths),
      location,
      comment,
      point,
      time,
      nice,
      type,
      uid,
      postId);

  @override
  String toString() {
    return 'Post(imagePaths: $imagePaths, location: $location, comment: $comment, point: $point, time: $time, nice: $nice, type: $type, uid: $uid, postId: $postId)';
  }
}

/// @nodoc
abstract mixin class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) =
      _$PostCopyWithImpl;
  @useResult
  $Res call(
      {List<String> imagePaths,
      LatLng location,
      String comment,
      int point,
      DateTime time,
      int nice,
      PostType type,
      String uid,
      String postId});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagePaths = null,
    Object? location = null,
    Object? comment = null,
    Object? point = null,
    Object? time = null,
    Object? nice = null,
    Object? type = null,
    Object? uid = null,
    Object? postId = null,
  }) {
    return _then(_self.copyWith(
      imagePaths: null == imagePaths
          ? _self.imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nice: null == nice
          ? _self.nice
          : nice // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Post implements Post {
  const _Post(
      {required final List<String> imagePaths,
      required this.location,
      required this.comment,
      required this.point,
      required this.time,
      required this.nice,
      required this.type,
      required this.uid,
      required this.postId})
      : _imagePaths = imagePaths;
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  final List<String> _imagePaths;
  @override
  List<String> get imagePaths {
    if (_imagePaths is EqualUnmodifiableListView) return _imagePaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagePaths);
  }

  @override
  final LatLng location;
  @override
  final String comment;
  @override
  final int point;
  @override
  final DateTime time;
  @override
  final int nice;
  @override
  final PostType type;
  @override
  final String uid;
  @override
  final String postId;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            const DeepCollectionEquality()
                .equals(other._imagePaths, _imagePaths) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.nice, nice) || other.nice == nice) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imagePaths),
      location,
      comment,
      point,
      time,
      nice,
      type,
      uid,
      postId);

  @override
  String toString() {
    return 'Post(imagePaths: $imagePaths, location: $location, comment: $comment, point: $point, time: $time, nice: $nice, type: $type, uid: $uid, postId: $postId)';
  }
}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) =
      __$PostCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<String> imagePaths,
      LatLng location,
      String comment,
      int point,
      DateTime time,
      int nice,
      PostType type,
      String uid,
      String postId});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imagePaths = null,
    Object? location = null,
    Object? comment = null,
    Object? point = null,
    Object? time = null,
    Object? nice = null,
    Object? type = null,
    Object? uid = null,
    Object? postId = null,
  }) {
    return _then(_Post(
      imagePaths: null == imagePaths
          ? _self._imagePaths
          : imagePaths // ignore: cast_nullable_to_non_nullable
              as List<String>,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LatLng,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      nice: null == nice
          ? _self.nice
          : nice // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PostType,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
