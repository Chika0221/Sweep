// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/states/get_posts_provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart'; // Firestoreを使用する場合
import 'package:sweep/classes/post.dart'; // Postモデルのインポート
import 'package:sweep/pages/timaline_page/post_item.dart'; // 各投稿を表示するウィジェット (別途作成が必要)

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postData = ref.watch(postStreamProvider); // 投稿データをwatchする

    return Scaffold(
      appBar: AppBar(
        title: const Text('タイムライン'),
        centerTitle: true,
      ),
      body: postData.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()), // 読み込み中
        error: (err, stack) => Center(child: Text('エラー: $err')), // エラー発生時
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('まだ投稿がありません。')); // 投稿がない場合
          }
          // 投稿リストを表示
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              // 各投稿を PostItem ウィジェットで表示
              return PostItem(post: post); // PostItem ウィジェットは別途定義が必要です
            },
          );
        },
      ),
    );
  }
}
