// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';

final postStreamProvider = StreamProvider.autoDispose<List<Post>>((ref) {
  final collection = FirebaseFirestore.instance.collection("post");

  final stream =
      collection.orderBy("time", descending: true).snapshots().map((e) {
    return e.docs.map((e) => Post.fromJson(e.data())).toList();
  });

  return stream;
});
