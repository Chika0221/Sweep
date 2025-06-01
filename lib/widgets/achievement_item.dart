// lib/widgets/achievement_item.dart

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sweep/classes/achievement.dart';

class AchievementItem extends StatelessWidget {
  final Achievement achievement;

  const AchievementItem({
    Key? key,
    required this.achievement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isUnlocked = achievement.isUnlocked;
    final int progress = achievement.currentProgress ?? 0;
    final double progressValue = achievement.criteria > 0
                                  ? (progress / achievement.criteria).clamp(0.0, 1.0)
                                  : 0.0;

    return Card(
      elevation: isUnlocked ? 4.0 : 1.0,
      color: isUnlocked ? Colors.amber.shade100 : Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isUnlocked ? Colors.amber.shade400 : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                isUnlocked ? Icons.emoji_events : Icons.lock_outline,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    achievement.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: isUnlocked ? Colors.grey.shade800 : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    achievement.description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: isUnlocked ? Colors.grey.shade700 : Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  if (!isUnlocked)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '進捗: $progress / ${achievement.criteria}', // Use currentProgress
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        LinearProgressIndicator(
                          value: progressValue, // Use calculated progressValue
                          backgroundColor: Colors.grey.shade400,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade600),
                        ),
                      ],
                    ),
                  if (isUnlocked)
                    Text(
                      '達成済み!',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
