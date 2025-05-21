import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sweep/pages/history_page.dart';

class DiaryPlate extends HookConsumerWidget {
  const DiaryPlate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HistoryPage(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30 - 16),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("今週の報告数"),
            Row(
              children: [
                Text(
                  "11L",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  "履歴の確認",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 18,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
