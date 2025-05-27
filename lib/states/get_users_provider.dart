// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';

final userStreamProvider = StreamProvider.autoDispose<List<Profile>>((ref) {
  final collection = FirebaseFirestore.instance.collection("user");

  final stream =
      collection.orderBy("point", descending: true).snapshots().map((e) {
    return e.docs.map((e) => Profile.fromJson(e.data())).toList();
  });

  return stream;
});
