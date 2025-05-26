import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/states/login_notifier.dart';
import 'package:sweep/states/profile_provider.dart';
import 'package:sweep/themes/app_theme.dart';

class PointPlate extends HookConsumerWidget {
  const PointPlate({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        border: Border.all(
          color: pointBackground,
          width: 4,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                "assets/images/coin.png",
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            "${profile!.point.toString()}P",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
