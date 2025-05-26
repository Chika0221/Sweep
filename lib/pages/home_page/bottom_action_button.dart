// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomActionButton extends HookConsumerWidget {
  const BottomActionButton({
    super.key,
    required this.upText,
    required this.bottomText,
    required this.bottomIcon,
    required this.upOnTap,
    required this.bottomOnTap,
  });

  final String upText;
  final String bottomText;
  final IconData bottomIcon;
  final void Function() upOnTap;
  final void Function() bottomOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton.extended(
      onPressed: bottomOnTap,
      label: Text(bottomText),
      icon: Icon(bottomIcon),
    );
  }
}
