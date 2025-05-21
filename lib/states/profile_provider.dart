import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class ProfileNotifier extends StateNotifier<User?> {
  ProfileNotifier() : super(null);

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

  Future<void> firebaseFirestoreSignIn() async {
    // 謎解く
    //     if (await checkExisting(newUser.email.toString())) {
    //   await FirebaseFirestore.instance
    //       .collection("user")
    //       .where("email", isEqualTo: newUser.email.toString())
    //       .get()
    //       .then((QuerySnapshot snapshot) {
    //     UserDocsId = snapshot.docs[0].id;
    //   });
    // } else {
    //   final data = {
    //     "name": newUser.displayName,
    //     "email": newUser.email,
    //   };

    //   final UserDoc = await FirebaseFirestore.instance.collection("user").doc();
    //   await UserDoc.set(data);
    //   UserDocsId = UserDoc.id;
    // }
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, User?>((ref) {
  return ProfileNotifier();
});
