import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/widgets/diary_plate.dart';
import 'package:sweep/widgets/history_plate.dart';
import 'package:sweep/widgets/name_plate.dart';
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                // color: Theme.of(context).colorScheme.secondaryContainer,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ],
                ),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  DiaryPlate(),
                  HistoryPlate(),
                  SizedBox(
                    height: 500,
                    child: Container(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
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
