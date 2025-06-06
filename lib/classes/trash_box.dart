// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'trash_box.freezed.dart';
part 'trash_box.g.dart';

@freezed
class TrashBox with _$TrashBox {
  const factory TrashBox({
    required String name,
    required String trashBoxId,
    required LatLng location,
    required int maxWeight,
    @Default(0) int weight,
  }) = _TrashBox;

  factory TrashBox.fromJson(Map<String, dynamic> json) =>
      _$TrashBoxFromJson(json);

  @override
  // TODO: implement location
  LatLng get location => throw UnimplementedError();

  @override
  // TODO: implement maxWeight
  int get maxWeight => throw UnimplementedError();

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement trashBoxId
  String get trashBoxId => throw UnimplementedError();

  @override
  // TODO: implement weight
  int get weight => throw UnimplementedError();
}
