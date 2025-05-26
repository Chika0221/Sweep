import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sweep/pages/home_page/week_Indicator.dart';
import 'package:sweep/states/profile_provider.dart';

class ContinuousLoginPlate extends HookConsumerWidget {
  const ContinuousLoginPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final continuousCount = ref.watch(profileProvider)?.continuousCount;

    int max_index = 0;
    if (continuousCount! <= 7) {
      max_index = 1;
    } else if (continuousCount! <= 14) {
      max_index = 2;
    } else if (continuousCount! <= 21) {
      max_index = 3;
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            "連続記録",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ...List.generate(
            (2),
            (index) {
              return WeekIndicator();
            },
          ),
        ],
      ),
    );
  }
}
