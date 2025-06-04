// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/timaline_page/post_item.dart';
import 'package:sweep/states/get_posts_provider.dart';
import 'package:sweep/states/profile_provider.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(getPostsProvider);
    final profile = ref.watch(profileProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async => ref.read(getPostsProvider.notifier).refresh(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text("履歴"),
              centerTitle: true,
              surfaceTintColor: Colors.blue,
              pinned: false,
              floating: true,
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
                    if (post.uid == profile!.uid) {
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
          ],
        ),
      ),
    );
  }
}
