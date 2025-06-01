// lib/widgets/achievements_list.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sweep/classes/achievement.dart';        // Adjust import path
import 'package:sweep/states/achievements_provider.dart'; // Adjust import path
import 'package:sweep/widgets/achievement_item.dart';   // Adjust import path

class AchievementsList extends ConsumerWidget {
  const AchievementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievementsData = ref.watch(achievementsDataProvider);

    if (achievementsData.isEmpty) {
      return const Center(
        child: Text('アチーブメントはありません。'),
      );
    }

    // Example: Get actual user trash count if available from an existing provider
    // For now, this is not implemented as per user feedback to keep it UI focused.
    // final userTrashCount = ref.watch(profileProvider)?.trashCount ?? 0; // Fictional example

    return ListView.separated(
      itemCount: achievementsData.length,
      itemBuilder: (context, index) {
        final achievement = achievementsData[index];

        // Determine if unlocked based on some logic.
        // For now, we'll use the 'isUnlocked' field in the mock data,
        // or a simple check against criteria if we had a 'userTrashCount'.
        // Since we want to keep it UI-focused and not introduce new logic in providers,
        // we can either rely on pre-set `isUnlocked` in `achievements_data.dart`
        // or, if we had an *existing* provider for user stats, use it here.
        // Let's assume for now `achievement.isUnlocked` from data is the source of truth for display.
        // If `profileProvider` (or another existing provider) had `totalTrashCollected`, we could do:
        // final bool isActuallyUnlocked = (userTrashCount >= achievement.criteria) && achievement.id.startsWith('trash_collector');
        // For now, we pass the achievement as is, and AchievementItem uses its isUnlocked field.

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: AchievementItem(
            achievement: achievement,
            // We could potentially pass user progress here if it was easily available
            // from an existing provider and AchievementItem was set up to use it.
            // currentUserProgress: userTrashCount,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}
