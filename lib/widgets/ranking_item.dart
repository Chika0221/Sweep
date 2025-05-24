import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/profile.dart';
import 'package:sweep/widgets/ranking_icons.dart';

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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      child: ListTile(
        leading: RankingIcons(
          ranking: rankList[index],
        ),
        title: Text(
          profile.displayName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        trailing: Text(
          "99P",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
