// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/pages/map_page/filter_block.dart';
import 'package:sweep/states/get_posts_provider.dart';

import 'package:sweep/pages/timaline_page/post_item.dart'; // 各投稿を表示するウィジェット (別途作成が必要)

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(getPostsProvider); // 投稿データをwatchする

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.read(getPostsProvider.notifier).refresh(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('タイムライン'),
              centerTitle: true,
              surfaceTintColor: Colors.blue,
              pinned: false,
              floating: true,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 64),
                child: FilterBlock(
                  filterOptions: [
                    PostType.trash,
                    PostType.trashCan,
                  ],
                ),
              ),
            ),
            postData.when(
              loading: () => SliverToBoxAdapter(
                  child: const Center(
                      child: CircularProgressIndicator())), // 読み込み中
              error: (err, stack) => Center(child: Text('エラー: $err')), // エラー発生時
              data: (posts) {
                if (posts.isEmpty) {
                  return SliverToBoxAdapter(
                      child:
                          const Center(child: Text('まだ投稿がありません。'))); // 投稿がない場合
                }
                // 投稿リストを表示
                return SliverList.separated(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    // 各投稿を PostItem ウィジェットで表示
                    return PostItem(post: post); // PostItem ウィジェットは別途定義が必要です
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
    );
  }
}
