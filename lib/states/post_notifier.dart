import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/post.dart';

class PostNotifier extends StateNotifier<Post?> {
  PostNotifier() : super(null);

}

final postProvider = StateNotifierProvider<PostNotifier, Post?>((ref) {
  return PostNotifier();
});
