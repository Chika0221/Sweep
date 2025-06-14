// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/themes/app_theme.dart';

class PointDialog extends HookConsumerWidget {
  const PointDialog({
    super.key,
    required this.text,
    required this.title,
    required this.point,
  });

  final String text;
  final String title;
  final String point;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: deviceWidth * 0.7,
          height: deviceWidth * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            border: Border.all(
              color: pointBackground,
              width: 4,
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Spacer(
                flex: 2,
              ),
              Wrap(
                children: List.generate(
                  int.parse(point),
                  (index) {
                    return SizedBox(
                      height: 48,
                      width: 48,
                      child: Image.asset(
                        "assets/images/coin.png",
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                ),
              ),
              Spacer(
                flex: 2,
              ),
              OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                label: Text("閉じる"),
                icon: Icon(Icons.close_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
