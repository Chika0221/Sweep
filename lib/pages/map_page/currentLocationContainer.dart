// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Currentlocationcontainer extends HookConsumerWidget {
  const Currentlocationcontainer({
    super.key,
    required this.diameter,
    required this.backgroundColor,
    required this.lineColor,
  });

  final double diameter;
  final Color backgroundColor;
  final Color lineColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: lineColor,
        border: Border.all(color: backgroundColor, width: 2),
      ),
      padding: EdgeInsets.all(3),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
      ),
    );
  }
}
