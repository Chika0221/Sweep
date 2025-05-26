// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';
import 'package:sweep/pages/main_page.dart';

class LoginNotifier extends Notifier<String> {
  @override
  String build() => "";

  final FirebaseAuth auth = FirebaseAuth.instance;
  late User? tempUser;
  String verificationId = "";
  String resendTokenString = "";

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuthSignIn(credential);
    } catch (e) {
      debugPrint("error:$e");
    }
  }

  Future<void> signInWithPhoneNumber(context, String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await firebaseAuthSignIn(credential);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (conetxt) => MainPage(),
          ),
        );
      },
      verificationFailed: (e) {
        // 電話番号が間違っていた場合などのFirebaseのエラーが返された場合に、呼び出されます。これが呼び出された場合に、エラー表示をして、再送信や入力を戻す必要があります。
      },
      codeSent: (id, resendToken) {
        verificationId = id;
        resendTokenString = resendToken?.toString() ?? "";
      },
      codeAutoRetrievalTimeout: (id) {},
      forceResendingToken: null,
    );
  }

  Future<void> verifyCodePhoneNumber(String code) async {
    PhoneAuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: code,
    );

    await firebaseAuthSignIn(authCredential);
  }

  Future<void> firebaseAuthSignIn(AuthCredential authCredential) async {
    final UserCredential userCredential =
        await auth.signInWithCredential(authCredential);
    final User? user = userCredential.user;

    await firebaseFirestoreSignIn(user);
  }

  Future<void> firebaseFirestoreSignIn(User? newUser) async {
    Future<bool> checkExisting(String email) async {
      bool check = false;
      await FirebaseFirestore.instance
          .collection("user")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          if (doc.get("email").toString() == email) {
            check = true;
          }
        });
      });
      return Future<bool>.value(check);
    }

    if (await checkExisting(newUser!.email.toString())) {
      await FirebaseFirestore.instance
          .collection("user")
          .where("email", isEqualTo: newUser.email.toString())
          .get()
          .then(
        (QuerySnapshot snapshot) {
          final data = snapshot.docs[0];
          state = data.get("uid").toString();
        },
      );
    } else {
      // init
      final data = {
        "displayName": newUser.displayName!,
        "photoURL": newUser.photoURL!,
        "email": newUser.email,
        "uid": newUser.uid,
        "point": 0,
        "continuousCount": 0,
        "cumulativePoint": 0,
      };

      final UserDoc = await FirebaseFirestore.instance.collection("user").doc();
      await UserDoc.set(data);
      state = newUser.uid;
    }
  }
}

final loginProvider =
    NotifierProvider<LoginNotifier, String>(LoginNotifier.new);
