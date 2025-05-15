import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final userProvider = StateProvider<User?>((ref) {
//   return null;
// });

// テスト版のみで使うクラスとプロバイダー
final userProvider = StateProvider<uuuser>((ref) {
  return uuuser(
    displayName: "三谷　誓",
    email: "y240159@mail.ryukoku.ac.jp",
    photoURL: "https://picsum.photos/300/300",
  );
});

class uuuser {
  final String? displayName;
  final String? email;
  final String? photoURL;

  uuuser({this.displayName, this.email, this.photoURL});
}
