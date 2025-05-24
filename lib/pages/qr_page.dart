import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sweep/states/profile_provider.dart';

class QRPage extends HookConsumerWidget {
  const QRPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widget_size = MediaQuery.of(context).size.width * 0.9;
    final profile = ref.watch(profileProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("ゴミ箱と接続"),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: widget_size,
            height: widget_size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
            padding: EdgeInsets.all(16),
            child: QrImageView(
              data: profile!.uid,
            ),
          ),
        ));
  }
}
