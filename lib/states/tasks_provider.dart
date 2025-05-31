// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/task.dart';
import 'package:sweep/scripts/firebase_update_script.dart';
import 'package:sweep/states/profile_provider.dart';

final dailyTaskProvider = StreamProvider((ref) {
  final profile = ref.watch(profileProvider);

  final stream = FirebaseFirestore.instance
      .collection(CollectionName.user.name)
      .doc((profile != null) ? profile.uid : "")
      .collection(CollectionName.daily_task.name)
      .orderBy("isComplete")
      .snapshots()
      .map(
    (e) {
      return e.docs.map((e) => Task.fromJson(e.data())).toList();
    },
  );

  return stream;
});

final weeklyTaskProvider = StreamProvider((ref) {
  final profile = ref.watch(profileProvider);

  final stream = FirebaseFirestore.instance
      .collection(CollectionName.user.name)
      .doc((profile != null) ? profile.uid : "")
      .collection(CollectionName.weekly_task.name)
      .orderBy("isComplete")
      .snapshots()
      .map(
    (e) {
      return e.docs.map((e) => Task.fromJson(e.data())).toList();
    },
  );

  return stream;
});

Future<void> completeTask(WidgetRef ref, CollectionName colName, TaskType type,
    [String? uid]) async {
  if (uid == null) {
    final profile = ref.watch(profileProvider);
    uid = profile?.uid;
  }

  FirebaseFirestore.instance
      .collection(CollectionName.user.name)
      .doc(uid)
      .collection(colName.name)
      .doc(type.name)
      .update({"isComplete": true});
}

enum TaskType {
  login,
  post,
  box,
  get_point,
}
