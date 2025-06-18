// Package imports:
// import 'package:cloud_firestore/cloud_firestore.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/states/tasks_provider.dart';
import 'package:sweep/widgets/point_dialog.dart';

class FirebaseUpdateScript {
  Future<void> updateField(CollectionName colName, String docId,
      String updateField, dynamic value) async {
    await FirebaseFirestore.instance
        .collection(colName.name)
        .doc(docId)
        .update({updateField: value});
  }

  Future<void> completeTask(
      String uid, CollectionName tasksType, TaskType taskType) async {
    await FirebaseFirestore.instance
        .collection(CollectionName.user.name)
        .doc(uid)
        .collection(tasksType.name)
        .doc(taskType.name)
        .update({"isComplete": true});
  }

  Future<void> updateUserPoint(
      BuildContext context, WidgetRef ref, int point) async {
    final profile = ref.watch(profileProvider);
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

  Future<void> deletePost(Post post) async {
    await deleteDocument(CollectionName.post, post.postId);
    for (var imagePath in post.imagePaths) {
      final storageReference = FirebaseStorage.instance.refFromURL(imagePath);
      await storageReference.delete();
    }
  }

  Future<void> deleteDocument(CollectionName colName, String docId) async {
    await FirebaseFirestore.instance
        .collection(colName.name)
        .doc(docId)
        .delete();
  }
}

enum CollectionName {
  user,
  post,
  dailyTask,
  weeklyTask,
}
