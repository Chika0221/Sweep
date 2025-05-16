import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrashMakerChild extends HookConsumerWidget {
  const TrashMakerChild({super.key});
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
    );
  }
}
