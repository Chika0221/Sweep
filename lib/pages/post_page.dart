import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/states/image_provider.dart';
import 'package:sweep/states/post_notifier.dart';

class PostPage extends HookConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstImage = ref.watch(imagePathProvider);
    final postData = ref.watch(postProvider);


    return Image.network(firstImage);
  }
}
