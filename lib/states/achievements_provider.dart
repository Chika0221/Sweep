// lib/states/achievements_provider.dart

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sweep/classes/achievement.dart'; // Adjust import path
import 'package:sweep/data/achievements_data.dart'; // Adjust import path

// A simple provider that exposes the static list of all achievements.
final achievementsDataProvider = Provider<List<Achievement>>((ref) {
  // The UI will be responsible for interpreting 'isUnlocked' or checking criteria.
  // For now, it returns the raw list from achievements_data.dart.
  // If we had a simple way to get total trash count from an *existing* provider,
  // we could update `isUnlocked` here. For example:
  //
  // try {
  //   final totalTrashCollected = ref.watch(profileProvider)?.trashCount ?? 0; // Assuming 'trashCount' exists on Profile
  //   return allAchievements.map((ach) {
  //     bool unlocked = totalTrashCollected >= ach.criteria;
  //     // This is a simple check. Some achievements might have different types of criteria.
  //     // For 'area_cleaner_park', this logic is insufficient.
  //     if (ach.id.startsWith('trash_collector')) {
  //        return ach.copyWith(isUnlocked: unlocked);
  //     }
  //     return ach; // Return as is if logic is complex or data not available
  //   }).toList();
  // } catch (e) {
  //   // If profileProvider is null or trashCount doesn't exist, return default list
  //   return allAchievements;
  // }
  //
  // For now, per user feedback to keep it simple and UI-focused:
  return allAchievements;
});
