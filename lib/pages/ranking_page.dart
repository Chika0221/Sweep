import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/states/get_users_provider.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/widgets/ranking_item.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("ランキング"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: userStream.when(
          data: (users) {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return RankingItem(
                  profile: users[index],
                  index: index,
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
