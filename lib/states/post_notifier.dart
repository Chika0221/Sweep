import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/post.dart';

class PostNotifier extends StateNotifier<Post?> {
  PostNotifier() : super(null);

  void clear() {
    state = null;
  }

  void set(Post post) {
    state = post;
    print(state);
  }
}

final postProvider = StateNotifierProvider<PostNotifier, Post?>((ref) {
  return PostNotifier();
});
