import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/post.dart';
import 'package:sweep/classes/profile.dart';

final userStreamProvider = StreamProvider.autoDispose<List<Profile>>((ref) {
  final collection = FirebaseFirestore.instance.collection("user");

  final stream = collection.snapshots().map((e) {
    return e.docs.map((e) => Profile.fromJson(e.data())).toList();
  });

  return stream;
});
