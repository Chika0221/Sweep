import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/widgets/history_plate.dart';
import 'package:sweep/widgets/name_plate.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   title: Text("ユーザー名"),
        //   actions: [
        //     Milebox(),
        //     SizedBox(
        //       width: 4,
        //     )
        //   ],
        //   snap: false,
        //   floating: true,
        //   // pinned: false,
        //   backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        // ),
        SliverList(
          
          delegate: SliverChildListDelegate(
            [
              NamePlate(),
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
    );
  }
}
