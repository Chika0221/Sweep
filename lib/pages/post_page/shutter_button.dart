import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShutterButton extends HookConsumerWidget {
  const ShutterButton({
    super.key,
    required this.onTap,
    required this.diameter,
    required this.backgroundColor,
    required this.lineColor,
  });

  final void Function() onTap;
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
        border: Border.all(
          color: backgroundColor,
          width: 2
        ),
      ),
      padding: EdgeInsets.all(3),
      child: InkResponse(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
          ),
        ),
      ),
    );
  }
}
