// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/home_page/plate_magin.dart';
import 'package:sweep/states/tasks_provider.dart';

class WeeklyTaskPlate extends HookConsumerWidget {
  const WeeklyTaskPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(weeklyTaskProvider);

    return PlateMagin(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ウィークリータスク",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          tasks.when(
            data: (data) {
              return ListView.separated(
                shrinkWrap: true, // Important to prevent unbounded height
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final task = data[index];

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: (!task.isComplete)
                          ? Theme.of(context).colorScheme.tertiaryContainer
                          : Theme.of(context).colorScheme.surfaceContainerHigh,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            task.name,
                            style: TextStyle(
                              decoration: (task.isComplete)
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontWeight: (!task.isComplete)
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          trailing: (task.isComplete)
                              ? Icon(Icons.check_rounded)
                              : SizedBox.shrink(),
                        ),
                        LinearProgressIndicator(
                          minHeight: 8,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8),
                          ),
                          value: task.progress,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 4,
                  );
                },
              );
            },
            error: (error, stackTrace) {
              return SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: Text("エラーです"),
                ),
              );
            },
            loading: () {
              return SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
