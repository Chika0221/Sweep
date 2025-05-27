// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  String get displayName;
  String get photoURL;
  String get uid;
  int get point;
  int get continuousCount;
  int get cumulativePoint;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.continuousCount, continuousCount) ||
                other.continuousCount == continuousCount) &&
            (identical(other.cumulativePoint, cumulativePoint) ||
                other.cumulativePoint == cumulativePoint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, photoURL, uid,
      point, continuousCount, cumulativePoint);

  @override
  String toString() {
    return 'Profile(displayName: $displayName, photoURL: $photoURL, uid: $uid, point: $point, continuousCount: $continuousCount, cumulativePoint: $cumulativePoint)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {String displayName,
      String photoURL,
      String uid,
      int point,
      int continuousCount,
      int cumulativePoint});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? photoURL = null,
    Object? uid = null,
    Object? point = null,
    Object? continuousCount = null,
    Object? cumulativePoint = null,
  }) {
    return _then(_self.copyWith(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _self.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      continuousCount: null == continuousCount
          ? _self.continuousCount
          : continuousCount // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativePoint: null == cumulativePoint
          ? _self.cumulativePoint
          : cumulativePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Profile implements Profile {
  const _Profile(
      {required this.displayName,
      required this.photoURL,
      required this.uid,
      required this.point,
      required this.continuousCount,
      required this.cumulativePoint});
  factory _Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  final String displayName;
  @override
  final String photoURL;
  @override
  final String uid;
  @override
  final int point;
  @override
  final int continuousCount;
  @override
  final int cumulativePoint;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.continuousCount, continuousCount) ||
                other.continuousCount == continuousCount) &&
            (identical(other.cumulativePoint, cumulativePoint) ||
                other.cumulativePoint == cumulativePoint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, photoURL, uid,
      point, continuousCount, cumulativePoint);

  @override
  String toString() {
    return 'Profile(displayName: $displayName, photoURL: $photoURL, uid: $uid, point: $point, continuousCount: $continuousCount, cumulativePoint: $cumulativePoint)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String displayName,
      String photoURL,
      String uid,
      int point,
      int continuousCount,
      int cumulativePoint});
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayName = null,
    Object? photoURL = null,
    Object? uid = null,
    Object? point = null,
    Object? continuousCount = null,
    Object? cumulativePoint = null,
  }) {
    return _then(_Profile(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _self.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      continuousCount: null == continuousCount
          ? _self.continuousCount
          : continuousCount // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativePoint: null == cumulativePoint
          ? _self.cumulativePoint
          : cumulativePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
