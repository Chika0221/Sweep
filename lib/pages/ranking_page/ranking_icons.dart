// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RankingIcons extends HookConsumerWidget {
  const RankingIcons({
    super.key,
    required this.ranking,
  });

  final Rankings ranking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Center(
        child: Container(
          width: ranking.size,
          height: ranking.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ranking.color,
          ),
          child: Center(
            child: Text(
              (ranking.index + 1).toString(),
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const rankList = [
  Rankings.first,
  Rankings.second,
  Rankings.third,
  Rankings.other
];

enum Rankings {
  first(color: Colors.amber, size: 64),
  second(color: Colors.grey, size: 50),
  third(color: Colors.brown, size: 50),
  other(color: Colors.transparent, size: 50);

  const Rankings({
    required this.color,
    required this.size,
  });

  final Color color;
  final double size;
}
