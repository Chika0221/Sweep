// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/classes/trash_box.dart';
import 'package:sweep/states/filter_provider.dart';

final getTrashBoxsProvider =
    AutoDisposeAsyncNotifierProvider<GetTrashBoxsNotifier, List<TrashBox>>(
  GetTrashBoxsNotifier.new,
);

class GetTrashBoxsNotifier extends AutoDisposeAsyncNotifier<List<TrashBox>> {
  @override
  Future<List<TrashBox>> build() async {
    return _fetchTrashBoxs();
  }

  Future<List<TrashBox>> _fetchTrashBoxs() async {
    try {
      final collection = FirebaseFirestore.instance.collection("trashBox");
      final querySnapshot = await collection.get();
      final TrashBoxs = querySnapshot.docs
          .map((doc) => TrashBox.fromJson(doc.data()))
          .toList();
      state = AsyncValue.data(TrashBoxs);
      return TrashBoxs;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }

  Future<List<TrashBox>> filterTrashBoxs(WidgetRef ref) async {
    final filter = ref.watch(filterProvider);

    try {
      final allTrashBoxs = await _fetchTrashBoxs();
      if (filter.isEmpty) {
        state = AsyncValue.data(allTrashBoxs);
        return allTrashBoxs;
      }
      final filteredTrashBoxs = allTrashBoxs
          .where((TrashBox) => filter.contains(PostType.trashBox))
          .toList();
      state = AsyncValue.data(filteredTrashBoxs);
      return filteredTrashBoxs;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final TrashBoxs = await _fetchTrashBoxs();
      state = AsyncValue.data(TrashBoxs);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
