// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sweep/classes/post.dart'; // Postモデルをインポート

class PostItem extends HookConsumerWidget {
  const PostItem({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 画像を表示 (Firebase StorageのURLを使用)
            if (post.imagePaths.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  post.imagePaths.first, // 最初の画像を表示
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Icon(Icons.error, color: Colors.grey[600]),
                  ), // エラー時の表示
                ),
              ),
            const SizedBox(height: 12.0),
            // コメントを表示
            Text(
              post.comment,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            // 投稿日時やいいね数などを表示 (必要に応じて追加)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${post.time.toLocal().toString().split(' ')[0]}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16.0),
                    const SizedBox(width: 4.0),
                    Text('${post.nice}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
