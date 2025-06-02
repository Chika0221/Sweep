// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/classes/post.dart';
import 'package:sweep/pages/post_page/post_image_preview_page.dart';

import 'package:sweep/scripts/firebase_update_script.dart'; // Postモデルをインポート

class PostItem extends HookConsumerWidget {
  const PostItem({super.key, required this.post, this.showNiceButton = true});

  final Post post;
  final bool showNiceButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapNice = useState(false);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // コメントを表示
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  post.comment,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Chip(
                label: Text(post.type.displayName),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // 画像を表示 (Firebase StorageのURLを使用)
          (post.imagePaths.isNotEmpty)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Row(
                    spacing: 4,
                    children: List.generate(
                      post.imagePaths.length,
                      (index) {
                        return Flexible(
                          flex: post.imagePaths.length,
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImagePreviewPage(
                                  imagePaths: post.imagePaths,
                                  index: index,
                                  isNetwork: true,
                                ),
                              ),
                            ),
                            child: Image.network(
                              post.imagePaths[index], // 最初の画像を表示
                              fit: BoxFit.cover,
                              width: double.infinity,

                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: 200,
                                color: Colors.grey[300],
                                child:
                                    Icon(Icons.error, color: Colors.grey[600]),
                              ), // エラー時の表示
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : const SizedBox(height: 12.0),
          SizedBox(
            height: 16,
          ),
          // 投稿日時やいいね数などを表示 (必要に応じて追加)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${post.time.toString().split(' ')[0]} ${post.time.toString().split(' ')[1].split(".")[0]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              (showNiceButton)
                  ? Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            tapNice.value = !tapNice.value;
                            FirebaseUpdateScript().updateField(
                              CollectionName.post,
                              post.postId,
                              "nice",
                              post.nice + (tapNice.value ? 1 : -1),
                            );
                          },
                          icon: Icon(
                            Icons.favorite_rounded,
                            color: (tapNice.value)
                                ? Colors.pink
                                : Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Text('${post.nice}'),
                      ],
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
