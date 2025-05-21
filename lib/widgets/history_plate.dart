import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/pages/history_page.dart';

class HistoryPlate extends HookConsumerWidget {
  const HistoryPlate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondaryContainer,
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
        ),
        padding: EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("今日の投稿"),
                Text("+100C"),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
