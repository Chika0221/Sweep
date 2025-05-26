import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/pages/home_page/diary_plate.dart';
import 'package:sweep/pages/home_page/history_plate.dart';
import 'package:sweep/pages/home_page/name_plate.dart';
import 'package:sweep/pages/home_page/point_plate.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            NamePlate(),
            Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DiaryPlate(),
                  SizedBox(height: 16),
                  // HistoryPlate(),
                  // SizedBox(height: 16),
                  SizedBox(
                    height: 800,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color:
                            Theme.of(context).colorScheme.surfaceContainerLow,
                      ),
                      child: Center(
                        child: Text("まだないよ"),
                      ),
                    ),
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
