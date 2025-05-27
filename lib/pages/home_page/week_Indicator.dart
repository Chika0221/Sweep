// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WeekIndicator extends HookConsumerWidget {
  const WeekIndicator({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: List.generate(
        7,
        (index) {
          return WeekIndicatorBar(
            enable: (index < 4),
            sunday: (index % 7 == 0),
            saturday: (index % 7 == 6),
          );
        },
      ),
    );
  }
}

class WeekIndicatorBar extends HookConsumerWidget {
  const WeekIndicatorBar({
    super.key,
    required this.enable,
    required this.saturday,
    required this.sunday,
  });

  final bool enable;
  final bool sunday;
  final bool saturday;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;

    Color disbleColor;
    if (sunday) {
      disbleColor = Colors.red.withAlpha(100);
    } else if (saturday) {
      disbleColor = Colors.blue.withAlpha(100);
    } else {
      disbleColor = Theme.of(context).colorScheme.surfaceContainerHighest;
    }

    return Container(
      width: deviceWidth / 9,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: (enable) ? Theme.of(context).colorScheme.tertiary : disbleColor,
      ),
    );
  }
}
