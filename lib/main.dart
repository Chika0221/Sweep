// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/firebase_options.dart';
import 'package:sweep/pages/login_page/login_page.dart';
import 'package:sweep/pages/main_page.dart';
import 'package:sweep/scripts/notification_script.dart';
import 'package:sweep/states/analytics_provider.dart';
import 'package:sweep/states/fcmtoken_provider.dart';
import 'package:sweep/states/login_notifier.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

User? userInit = null;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // firebase初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 通知の許可
  final messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );

  NotificationScript().msgListener();

  // final fid = await FirebaseInstallations.instance.getId();

  final app = MyApp();
  final providerScope = ProviderScope(child: app);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      userInit = user;
    }
  });

  runApp(providerScope);
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analytics = ref.watch(analyticsProvider);
    final analyticsObserver = ref.watch(analyticsObserverProvider);

    useEffect(() {
      if (userInit != null) {
        ref.read(loginProvider.notifier).initSignIn(userInit!);
      }
      return null;
    }, []);

    // FirebaseAnalyticsに送信
    analytics.logAppOpen();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (ref.watch(loginProvider) != "") ? MainPage() : LoginPage(),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade600,
        fontFamily: "Zen_Maru_Gothic",
      ),
      navigatorObservers: [analyticsObserver],
      navigatorKey: navigatorKey,
    );
  }
}
