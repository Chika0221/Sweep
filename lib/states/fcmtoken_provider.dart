// Package imports:

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// Project imports:
import 'package:sweep/scripts/firebase_update_script.dart';
import 'package:sweep/states/profile_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart'
    show Notifier, NotifierProvider, StateProvider, WidgetRef;

class FcmTokenNotifier extends Notifier<String> {
  @override
  build() async {
    return "";
  }

  Future<void> compareFcmToken(String? uid) async {
    final token = await FirebaseMessaging.instance.getToken();

    if (uid != null && token != null) {
      final doc = FirebaseFirestore.instance
          .collection(CollectionName.user.name)
          .doc(uid);

      final snapshot = await doc.get();
      final fieldValue = (snapshot.data()?['fcmToken'] as String?) ?? "";
      if (fieldValue != token) {
        doc.set({"fcmToken": state});
      }
    }
  }
}

final fcmTokenProvider =
    NotifierProvider<FcmTokenNotifier, String>(FcmTokenNotifier.new);
