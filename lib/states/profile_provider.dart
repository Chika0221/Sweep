// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';
import 'package:sweep/states/get_users_provider.dart';
import 'package:sweep/states/login_notifier.dart';

final profileProvider = StateProvider<Profile?>((ref) {
  final users = ref.watch(userStreamProvider);
  final uid = ref.watch(loginProvider);

  return users.when(
    data: (data) {
      for (var user in data) {
        if (user.uid == uid) {
          return user;
        }
      }
      return null; // Add a return statement for the case where no user is found
    },
    error: (object, stackTrace) {
      return Profile(
        displayName: "読込エラー",
        photoURL: "https://placehold.jp/200x200.png",
        uid: "読込エラー",
        point: 0,
        continuousCount: 0,
        cumulativePoint: 0,
      );
    },
    loading: () {
      return Profile(
        displayName: "読込中...",
        photoURL: "https://placehold.jp/200x200.png",
        uid: "読込中...",
        point: 0,
        continuousCount: 0,
        cumulativePoint: 0,
      );
    },
  );
});
