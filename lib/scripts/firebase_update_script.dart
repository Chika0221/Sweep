// Package imports:
// import 'package:cloud_firestore/cloud_firestore.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/widgets/point_dialog.dart';

Future<void> updateFirestoreField(CollectionName colName, String docId,
    String updateField, dynamic value) async {
  await FirebaseFirestore.instance
      .collection(colName.name)
      .doc(docId)
      .update({updateField: value});
}

Future<void> updateUserPoint(
    BuildContext context, WidgetRef ref, int point) async {
  final profile = ref.watch(profileProvider);
  final dialog = PointDialog(point: point);
  if (profile == null) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("プロフィール情報を取得できませんでした")));
  } else {
    final userDoc = await FirebaseFirestore.instance
        .collection(CollectionName.user.name)
        .doc(profile?.uid);
    userDoc.update({"point": (profile!.point + point)});
    userDoc.update({"continuousCount": profile!.continuousCount + point});
  }
}


enum CollectionName {
  user,
  post,
  daily_task,
  weekly_task,
}
