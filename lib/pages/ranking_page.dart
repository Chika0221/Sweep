import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ランキング"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {},
      ),
    );
  }
}
