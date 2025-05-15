import 'package:hooks_riverpod/hooks_riverpod.dart';

class MileNotifier extends StateNotifier<int> {
  MileNotifier() : super(0);


}


final mileProvider = StateNotifierProvider.autoDispose<MileNotifier, int>((ref) {
  return MileNotifier();
});

