// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

// Project imports:
import 'package:sweep/states/get_users_provider.dart';
import 'package:sweep/states/login_notifier.dart';
import 'package:sweep/states/profile_provider.dart';

class QRPage extends HookConsumerWidget {
  const QRPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widget_size = MediaQuery.of(context).size.width * 0.6;
    final profile = ref.watch(profileProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text("ゴミ箱と接続"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "ゴミ箱に表示して接続する",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                width: widget_size,
                height: widget_size,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16),
                child: (profile.uid != null)
                    ? QrImageView(
                        data: profile.uid,
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox.shrink(),
            ],
          ),
        ));
  }
}
