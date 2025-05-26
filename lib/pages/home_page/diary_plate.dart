import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sweep/pages/history_page/history_page.dart';
import 'package:sweep/states/login_notifier.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/pages/home_page/point_plate.dart';
import 'package:wave/wave.dart';

class DiaryPlate extends HookConsumerWidget {
  const DiaryPlate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HistoryPage(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("今週の獲得ポイント"),
                  Text(
                    "+${profile?.continuousCount}P",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PointPlate(),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "履歴の確認",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
