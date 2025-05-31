// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/firebase_options.dart';
import 'package:sweep/pages/login_page/login_page.dart';
import 'package:sweep/states/analytics_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final fid = await FirebaseInstallations.instance.getId();

  final app = MyApp();
  final providerScope = ProviderScope(child: app);

  runApp(providerScope);
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final analyticsObserver = ref.watch(analyticsObserverProvider);

    // FirebaseAnalyticsに送信
    analytics.logAppOpen();


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      themeMode: ThemeMode.light,
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade600,
        fontFamily: "Zen_Maru_Gothic",
      ),
      navigatorObservers: [analyticsObserver],
    );
  }
}
