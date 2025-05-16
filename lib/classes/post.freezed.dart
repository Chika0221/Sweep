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

// エラーのため追加
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Post {
  // List<String> get imagePaths;
  // LatLng get location;
  // String get comment;
  // int get point;
  // DateTime get time;
  // int get nice;

  // エラーのため追加
  List<String> get imagePaths => throw _privateConstructorUsedError;
  LatLng get location => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  int get nice => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostCopyWith<Post> get copyWith =>
      _$PostCopyWithImpl<Post>(this as Post, _$identity);

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
            (identical(other.nice, nice) || other.nice == nice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(imagePaths),
      location,
      comment,
      point,
      time,
      nice);

  @override
  String toString() {
    return 'Post(imagePaths: $imagePaths, location: $location, comment: $comment, point: $point, time: $time, nice: $nice)';
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
      int nice});
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
    ));
  }
}

/// @nodoc

class _Post implements Post {
  const _Post(
      {required final List<String> imagePaths,
      required this.location,
      required this.comment,
      required this.point,
      required this.time,
      required this.nice})
      : _imagePaths = imagePaths;

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

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

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
            (identical(other.nice, nice) || other.nice == nice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_imagePaths),
      location,
      comment,
      point,
      time,
      nice);

  @override
  String toString() {
    return 'Post(imagePaths: $imagePaths, location: $location, comment: $comment, point: $point, time: $time, nice: $nice)';
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
      int nice});
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
    ));
  }
}

// dart format on
