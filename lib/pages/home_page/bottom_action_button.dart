// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomActionButton extends HookConsumerWidget {
  const BottomActionButton({
    super.key,
    // required this.upText,
    // required this.bottomText,
    // required this.bottomIcon,
    required this.rightOnTap,
    required this.leftOnTap,
  });

  // final String upText;
  // final String bottomText;
  // final IconData bottomIcon;
  final void Function() rightOnTap;
  final void Function() leftOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Icon(Icons.add),
          ),
          VerticalDivider(),
          Center(
            child: Icon(Icons.h_mobiledata),
          ),
        ],
      ),
    );
  }
}
