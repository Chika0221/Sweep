import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String displayName,
    required String photoURL,
    required String uid,
    required int point,
    required int continuousCount,
  }) = _Profile;
}
