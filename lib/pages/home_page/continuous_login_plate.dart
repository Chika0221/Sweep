// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/home_page/plate_magin.dart';
import 'package:sweep/states/profile_provider.dart';

class ContinuousLoginPlate extends HookConsumerWidget {
  const ContinuousLoginPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final continuousCount = ref.watch(profileProvider)?.continuousCount;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerLow
            .withBlue(255 - continuousCount! * 2),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("連続記録", style: Theme.of(context).textTheme.bodyMedium),
          Spacer(),
          Text(
            "${continuousCount ?? 0}日連続",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
