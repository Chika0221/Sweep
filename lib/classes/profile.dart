// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    // ユーザー名
    required String displayName,
    // 写真のURL
    required String photoURL,
    // UID
    required String uid,
    // 今の保持ポイント
    required int point,
    // 連続記録
    required int continuousCount,
    // 今週の取得ポイント
    required int cumulativePoint,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  // TODO: implement continuousCount
  int get continuousCount => throw UnimplementedError();

  @override
  // TODO: implement cumulativePoint
  int get cumulativePoint => throw UnimplementedError();

  @override
  // TODO: implement displayName
  String get displayName => throw UnimplementedError();

  @override
  // TODO: implement photoURL
  String get photoURL => throw UnimplementedError();

  @override
  // TODO: implement point
  int get point => throw UnimplementedError();

  @override
  // TODO: implement uid
  String get uid => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
