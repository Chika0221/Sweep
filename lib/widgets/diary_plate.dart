import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DiaryPlate extends HookConsumerWidget {
  const DiaryPlate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    const widget_height = 160.0;
    
    return Container(
      height: widget_height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Center(
        child: Text("あ"),
      ),
    );
  }
}
