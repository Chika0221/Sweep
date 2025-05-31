// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/ranking_page/ranking_item.dart';
import 'package:sweep/states/get_users_provider.dart';
import 'package:sweep/states/login_notifier.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("週間ポイントランキング"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userStream.when(
          data: (users) {
            users
                .sort((a, b) => b.cumulativePoint.compareTo(a.cumulativePoint));

            return ListView.separated(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return RankingItem(
                  profile: users[index],
                  index: index,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8,
                );
              },
            );
          },
          error: (object, stacktrace) {
            return Center(
              child: Text("エラーです"),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
