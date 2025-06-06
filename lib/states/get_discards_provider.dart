// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/discard.dart';
import 'package:sweep/states/filter_provider.dart';

final getDiscardsProvider =
    AutoDisposeAsyncNotifierProvider<GetDiscardsNotifier, List<Discard>>(
  GetDiscardsNotifier.new,
);

class GetDiscardsNotifier extends AutoDisposeAsyncNotifier<List<Discard>> {
  @override
  Future<List<Discard>> build() async {
    return _fetchDiscards();
  }

  Future<List<Discard>> _fetchDiscards() async {
    try {
      final collection = FirebaseFirestore.instance.collection("discard");
      final querySnapshot =
          await collection.orderBy("time", descending: true).get();
      final Discards = querySnapshot.docs
          .map((doc) => Discard.fromJson(doc.data()))
          .toList();
      state = AsyncValue.data(Discards);
      return Discards;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final Discards = await _fetchDiscards();
      state = AsyncValue.data(Discards);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
