// lib/data/achievements_data.dart

// Project imports:
import 'package:sweep/classes/achievement.dart';

final List<Achievement> allAchievements = [
  Achievement(
    id: 'trash_collector_beginner',
    name: '見習い清掃員',
    description: 'ゴミを5個収集する',
    iconUrl: 'assets/images/achievements/trash_beginner.png',
    criteria: 5,
    isUnlocked: true, // Example: This one is unlocked
    currentProgress: 5,
  ),
  Achievement(
    id: 'trash_collector_intermediate',
    name: '一人前の清掃員',
    description: 'ゴミを20個収集する',
    iconUrl: 'assets/images/achievements/trash_intermediate.png',
    criteria: 20,
    isUnlocked: false,
    currentProgress: 15, // Example: Progress towards next achievement
  ),
  Achievement(
    id: 'trash_collector_master',
    name: '清掃マスター',
    description: 'ゴミを100個収集する',
    iconUrl: 'assets/images/achievements/trash_master.png',
    criteria: 100,
    isUnlocked: false,
    currentProgress: 15, // Same progress as above, just an example
  ),
  Achievement(
    id: 'area_cleaner_park',
    name: '公園の守り手',
    description: '公園エリアでゴミを10個収集する',
    iconUrl: 'assets/images/achievements/park_cleaner.png',
    criteria: 10,
    isUnlocked: true, // Example: This one is also unlocked
    currentProgress: 10,
  ),
  Achievement(
    id: 'recycler_novice',
    name: 'リサイクルの新人',
    description: 'リサイクルゴミを3種類見つける',
    iconUrl: 'assets/images/achievements/recycler_novice.png',
    criteria: 3, // Criteria here might mean 'types of items'
    isUnlocked: false,
    currentProgress: 1,
  ),
];
