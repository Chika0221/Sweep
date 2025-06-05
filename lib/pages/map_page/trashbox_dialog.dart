// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/trash_box.dart';

class TrashboxDialog extends HookConsumerWidget {
  const TrashboxDialog({
    super.key,
    required this.trashBox,
  });

  final TrashBox trashBox;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(
            value: 0.8,
            borderRadius: BorderRadius.circular(100),
          )
        ],
      ),
    );
  }
}
