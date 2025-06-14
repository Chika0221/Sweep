// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/profile.dart';
import 'package:sweep/pages/ranking_page/ranking_icons.dart';
import 'package:sweep/states/profile_provider.dart';

class RankingItem extends HookConsumerWidget {
  const RankingItem({
    super.key,
    required this.profile,
    required this.index,
  });

  final Profile profile;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meProfile = ref.watch(profileProvider);

    Rankings ranking = Rankings.other;

    if (index < 3) {
      ranking = rankList[index];
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: (meProfile!.uid == profile.uid)
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      child: ListTile(
        leading: RankingIcons(
          ranking: ranking,
          index: index,
        ),
        title: Text(
          profile.displayName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        trailing: Text(
          "${profile.cumulativePoint.toString()}P",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
