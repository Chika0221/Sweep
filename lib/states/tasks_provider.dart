// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/states/profile_provider.dart';

final dailyTackProvider = StreamProvider((ref) {
  final profile = ref.watch(profileProvider);

  final stream = FirebaseFirestore.instance
      .collection("user")
      .doc((profile != null) ? profile.uid : "")
      .collection("daily_task")
      .snapshots().map((e));

  return stream;
});
