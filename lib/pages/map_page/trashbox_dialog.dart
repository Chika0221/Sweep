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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(children: [
            Text(
              trashBox.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ]),
          const SizedBox(height: 16),
          SizedBox(
            height: 64,
            width: double.infinity,
            child: Stack(
              children: [
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(16),
                  value: trashBox.weight / trashBox.maxWeight,
                  minHeight: 64,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Chip(
                      backgroundColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      label: Text(
                        "${(trashBox.weight / 1000)}kg",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Add more information or actions related to the trashBox here
        ],
      ),
    );
  }
}
