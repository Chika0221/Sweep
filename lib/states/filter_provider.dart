// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';

final filterProvider = StateProvider<Set<PostType>>((ref) {
  return {PostType.trash, PostType.trashCan, PostType.trashBox};
});
