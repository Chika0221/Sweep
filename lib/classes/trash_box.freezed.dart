// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trash_box.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrashBox {

 String get name; String get trashBoxId; LatLng get location; int get maxWeight; int get weight;
/// Create a copy of TrashBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrashBoxCopyWith<TrashBox> get copyWith => _$TrashBoxCopyWithImpl<TrashBox>(this as TrashBox, _$identity);

  /// Serializes this TrashBox to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrashBox&&(identical(other.name, name) || other.name == name)&&(identical(other.trashBoxId, trashBoxId) || other.trashBoxId == trashBoxId)&&(identical(other.location, location) || other.location == location)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trashBoxId,location,maxWeight,weight);

@override
String toString() {
  return 'TrashBox(name: $name, trashBoxId: $trashBoxId, location: $location, maxWeight: $maxWeight, weight: $weight)';
}


}

/// @nodoc
abstract mixin class $TrashBoxCopyWith<$Res>  {
  factory $TrashBoxCopyWith(TrashBox value, $Res Function(TrashBox) _then) = _$TrashBoxCopyWithImpl;
@useResult
$Res call({
 String name, String trashBoxId, LatLng location, int maxWeight, int weight
});




}
/// @nodoc
class _$TrashBoxCopyWithImpl<$Res>
    implements $TrashBoxCopyWith<$Res> {
  _$TrashBoxCopyWithImpl(this._self, this._then);

  final TrashBox _self;
  final $Res Function(TrashBox) _then;

/// Create a copy of TrashBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? trashBoxId = null,Object? location = null,Object? maxWeight = null,Object? weight = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trashBoxId: null == trashBoxId ? _self.trashBoxId : trashBoxId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,maxWeight: null == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TrashBox implements TrashBox {
  const _TrashBox({required this.name, required this.trashBoxId, required this.location, required this.maxWeight, this.weight = 0});
  factory _TrashBox.fromJson(Map<String, dynamic> json) => _$TrashBoxFromJson(json);

@override final  String name;
@override final  String trashBoxId;
@override final  LatLng location;
@override final  int maxWeight;
@override@JsonKey() final  int weight;

/// Create a copy of TrashBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrashBoxCopyWith<_TrashBox> get copyWith => __$TrashBoxCopyWithImpl<_TrashBox>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrashBoxToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrashBox&&(identical(other.name, name) || other.name == name)&&(identical(other.trashBoxId, trashBoxId) || other.trashBoxId == trashBoxId)&&(identical(other.location, location) || other.location == location)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.weight, weight) || other.weight == weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,trashBoxId,location,maxWeight,weight);

@override
String toString() {
  return 'TrashBox(name: $name, trashBoxId: $trashBoxId, location: $location, maxWeight: $maxWeight, weight: $weight)';
}


}

/// @nodoc
abstract mixin class _$TrashBoxCopyWith<$Res> implements $TrashBoxCopyWith<$Res> {
  factory _$TrashBoxCopyWith(_TrashBox value, $Res Function(_TrashBox) _then) = __$TrashBoxCopyWithImpl;
@override @useResult
$Res call({
 String name, String trashBoxId, LatLng location, int maxWeight, int weight
});




}
/// @nodoc
class __$TrashBoxCopyWithImpl<$Res>
    implements _$TrashBoxCopyWith<$Res> {
  __$TrashBoxCopyWithImpl(this._self, this._then);

  final _TrashBox _self;
  final $Res Function(_TrashBox) _then;

/// Create a copy of TrashBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? trashBoxId = null,Object? location = null,Object? maxWeight = null,Object? weight = null,}) {
  return _then(_TrashBox(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trashBoxId: null == trashBoxId ? _self.trashBoxId : trashBoxId // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,maxWeight: null == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
