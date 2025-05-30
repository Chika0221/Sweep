// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/home_page/plate_magin.dart';

class WeeklyTaskPlate extends HookConsumerWidget {
  const WeeklyTaskPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = [
      "ゴミを拾う",
      "新しい場所を開拓する",
      "フレンドに挨拶する",
    ];

    // Placeholder for checkbox states
    final checkboxStates = useState(List.generate(tasks.length, (_) => false));

    return PlateMagin(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ウィークリータスク",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true, // Important to prevent unbounded height
            physics:
                const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index]),
                trailing: Checkbox(
                  value: checkboxStates.value[index],
                  onChanged: (bool? newValue) {
                    // This will be implemented in a later step
                    // For now, we just update the local state
                    final newStates = List<bool>.from(checkboxStates.value);
                    newStates[index] = newValue ?? false;
                    checkboxStates.value = newStates;
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
