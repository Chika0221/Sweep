// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';

final getPostsProvider =
    AutoDisposeAsyncNotifierProvider<GetPostsNotifier, List<Post>>(
  GetPostsNotifier.new,
);

class GetPostsNotifier extends AutoDisposeAsyncNotifier<List<Post>> {
  @override
  Future<List<Post>> build() async {
    return _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    try {
      final collection = FirebaseFirestore.instance.collection("post");
      final querySnapshot =
          await collection.orderBy("time", descending: true).get();
      final posts =
          querySnapshot.docs.map((doc) => Post.fromJson(doc.data())).toList();
      state = AsyncValue.data(posts);
      return posts;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final posts = await _fetchPosts();
      state = AsyncValue.data(posts);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
