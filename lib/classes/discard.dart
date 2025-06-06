// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'discard.freezed.dart';
part 'discard.g.dart';

@freezed
class Discard with _$Discard {
  const factory Discard({
    required String discardId,
    required DateTime time,
    required int weight,
    required String uid,
  }) = _Discard;

  factory Discard.fromJson(Map<String, dynamic> json) =>
      _$DiscardFromJson(json);

  @override
  // TODO: implement DiscardId
  String get discardId => throw UnimplementedError();

  @override
  // TODO: implement time
  DateTime get time => throw UnimplementedError();

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  @override
  // TODO: implement uid
  String get uid => throw UnimplementedError();

  @override
  // TODO: implement weight
  int get weight => throw UnimplementedError();
}
