// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/home_page/plate_magin.dart';

class DailyTaskPlate extends HookConsumerWidget {
  const DailyTaskPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = [
      "ログインする",
      "日記を書く",
      "今日の歩数を記録する",
    ];

    // Placeholder for checkbox states
    final checkboxStates = useState(List.generate(tasks.length, (_) => false));

    return PlateMagin(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "デイリータスク",
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
          SizedBox(
            height: 8,
          ),
          LinearProgressIndicator(
            value: checkboxStates.value.where((isChecked) => isChecked).length /
                tasks.length,
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  ((checkboxStates.value.where((element) => element).length) ==
                          tasks.length)
                      ? () {}
                      : null,
              child: Text("完了にする"),
            ),
          ),
        ],
      ),
    );
  }
}
