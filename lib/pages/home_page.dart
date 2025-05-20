import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/widgets/diary_plate.dart';
import 'package:sweep/widgets/history_plate.dart';
import 'package:sweep/widgets/name_plate.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                NamePlate(),
                DiaryPlate(),
                HistoryPlate(),
                SizedBox(
                  height: 500,
                  child: Container(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
