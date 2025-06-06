// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/timaline_page/post_item.dart';
import 'package:sweep/states/get_discards_provider.dart';
import 'package:sweep/states/get_posts_provider.dart';
import 'package:sweep/states/profile_provider.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(getPostsProvider);
    final discardData = ref.watch(getDiscardsProvider);
    final profile = ref.watch(profileProvider);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(getPostsProvider.notifier).refresh();
            ref.read(getDiscardsProvider.notifier).refresh();
          },
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text("履歴"),
                  centerTitle: true,
                  surfaceTintColor: Colors.blue,
                  pinned: false,
                  floating: true,
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: "ゴミ投稿",
                      ),
                      Tab(
                        text: "ゴミ捨て",
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                postData.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()), // 読み込み中
                  error: (err, stack) =>
                      Center(child: Text('エラー: $err')), // エラー発生時
                  data: (posts) {
                    if (posts.isEmpty) {
                      return const Center(
                        child: Text('まだ投稿がありません。'),
                      ); // 投稿がない場合
                    }
                    // 投稿リストを表示
                    return ListView.separated(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        if (post.uid == profile.uid) {
                          return PostItem(
                            post: post,
                            showNiceButton: false,
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    );
                  },
                ),
                discardData.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()), // 読み込み中
                  error: (err, stack) =>
                      Center(child: Text('エラー: $err')), // エラー発生時
                  data: (discards) {
                    print("wa-----${discards.length}");
                    if (discards.isEmpty) {
                      return const Center(
                        child: Text('まだゴミ捨ての記録がありません。'),
                      ); // 投稿がない場合
                    }
                    // ゴミ捨てリストを表示
                    return ListView.separated(
                      itemCount: discards.length,
                      itemBuilder: (context, index) {
                        final discard = discards[index];
                        if (discard.uid == profile.uid) {
                          return Text(discard.weight.toString());
                        }
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
