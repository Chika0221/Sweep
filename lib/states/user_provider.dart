import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(null);

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        state = null;
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseSignIn(credential);
    } catch (e) {
      debugPrint("error:$e");
    }
  }

  Future<void> firebaseSignIn(AuthCredential authCredential) async {
    final UserCredential userCredential =
        await auth.signInWithCredential(authCredential);
    final User? user = userCredential.user;

    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});
