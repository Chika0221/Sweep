// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:sweep/pages/home_page/plate_magin.dart';

class FeedbackPlate extends HookConsumerWidget {
  const FeedbackPlate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final url = Uri.parse('https://forms.gle/iVWt7mEZ688m759Q8');

    return PlateMagin(
      child: InkWell(
        onTap: () {
          launchUrl(url);
        },
        child: Text(
          "フィードバックの送信",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
