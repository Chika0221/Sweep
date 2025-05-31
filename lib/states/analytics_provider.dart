// Package imports:
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final analyticsProvider = StateProvider((ref) {
  return FirebaseAnalytics.instance;
});

final analyticsObserverProvider = StateProvider((ref) {
  return FirebaseAnalyticsObserver(analytics: ref.watch(analyticsProvider));
});
