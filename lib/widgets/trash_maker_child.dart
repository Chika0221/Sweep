import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/post.dart';

class TrashMakerChild extends HookConsumerWidget {
  const TrashMakerChild({super.key, required this.type});

  final PostType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/markers/trash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Icon(
          (type == PostType.trash) ? Icons.star :
          Icons.delete_rounded,
        ),
      ),
    );
  }
}
