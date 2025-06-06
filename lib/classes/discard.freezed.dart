// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Discard {
  String get discardId;
  DateTime get time;
  int get weight;
  String get uid;

  /// Create a copy of Discard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DiscardCopyWith<Discard> get copyWith =>
      _$DiscardCopyWithImpl<Discard>(this as Discard, _$identity);

  /// Serializes this Discard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Discard &&
            (identical(other.discardId, discardId) ||
                other.discardId == discardId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, discardId, time, weight, uid);

  @override
  String toString() {
    return 'Discard(DiscardId: $discardId, time: $time, weight: $weight, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class $DiscardCopyWith<$Res> {
  factory $DiscardCopyWith(Discard value, $Res Function(Discard) _then) =
      _$DiscardCopyWithImpl;
  @useResult
  $Res call({String DiscardId, DateTime time, int weight, String uid});
}

/// @nodoc
class _$DiscardCopyWithImpl<$Res> implements $DiscardCopyWith<$Res> {
  _$DiscardCopyWithImpl(this._self, this._then);

  final Discard _self;
  final $Res Function(Discard) _then;

  /// Create a copy of Discard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? DiscardId = null,
    Object? time = null,
    Object? weight = null,
    Object? uid = null,
  }) {
    return _then(_self.copyWith(
      DiscardId: null == DiscardId
          ? _self.discardId
          : DiscardId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Discard implements Discard {
  const _Discard(
      {required this.discardId,
      required this.time,
      required this.weight,
      required this.uid});
  factory _Discard.fromJson(Map<String, dynamic> json) =>
      _$DiscardFromJson(json);

  @override
  final String discardId;
  @override
  final DateTime time;
  @override
  final int weight;
  @override
  final String uid;

  /// Create a copy of Discard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DiscardCopyWith<_Discard> get copyWith =>
      __$DiscardCopyWithImpl<_Discard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DiscardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Discard &&
            (identical(other.discardId, discardId) ||
                other.discardId == discardId) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, discardId, time, weight, uid);

  @override
  String toString() {
    return 'Discard(DiscardId: $discardId, time: $time, weight: $weight, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class _$DiscardCopyWith<$Res> implements $DiscardCopyWith<$Res> {
  factory _$DiscardCopyWith(_Discard value, $Res Function(_Discard) _then) =
      __$DiscardCopyWithImpl;
  @override
  @useResult
  $Res call({String DiscardId, DateTime time, int weight, String uid});
}

/// @nodoc
class __$DiscardCopyWithImpl<$Res> implements _$DiscardCopyWith<$Res> {
  __$DiscardCopyWithImpl(this._self, this._then);

  final _Discard _self;
  final $Res Function(_Discard) _then;

  /// Create a copy of Discard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? DiscardId = null,
    Object? time = null,
    Object? weight = null,
    Object? uid = null,
  }) {
    return _then(_Discard(
      discardId: null == DiscardId
          ? _self.discardId
          : DiscardId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weight: null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
