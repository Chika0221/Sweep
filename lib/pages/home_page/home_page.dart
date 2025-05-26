// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

// Project imports:
import 'package:sweep/pages/home_page/continuous_login_plate.dart';
import 'package:sweep/pages/home_page/daily_task_plate.dart';
import 'package:sweep/pages/home_page/diary_plate.dart';
import 'package:sweep/pages/home_page/history_plate.dart';
import 'package:sweep/pages/home_page/name_plate.dart';
import 'package:sweep/pages/home_page/point_plate.dart';
import 'package:sweep/pages/home_page/weekly_task_plate.dart';

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
                  ContinuousLoginPlate(),
                  SizedBox(height: 16),
                  WeeklyTaskPlate(),
                  SizedBox(height: 16),
                  DailyTaskPlate(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
