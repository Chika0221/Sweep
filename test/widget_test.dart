// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:sweep/classes/achievement.dart';
import 'package:sweep/main.dart';
import 'package:sweep/widgets/achievement_item.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  group('AchievementItem Widget Tests', () {
    final lockedAchievement = Achievement(
      id: 'test_locked',
      name: 'Locked Ach',
      description: 'This is a locked achievement.',
      iconUrl: 'assets/icons/locked.png',
      criteria: 10,
      isUnlocked: false,
      currentProgress: 5,
    );

    final unlockedAchievement = Achievement(
      id: 'test_unlocked',
      name: 'Unlocked Ach',
      description: 'This is an unlocked achievement.',
      iconUrl: 'assets/icons/unlocked.png',
      criteria: 10,
      isUnlocked: true,
      currentProgress: 10,
    );

    testWidgets('renders correctly for a locked achievement', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: AchievementItem(achievement: lockedAchievement))));

      // Verify name and description
      expect(find.text('Locked Ach'), findsOneWidget);
      expect(find.text('This is a locked achievement.'), findsOneWidget);

      // Verify lock icon (specifics depend on implementation, checking for IconData here)
      expect(find.byIcon(Icons.lock_outline), findsOneWidget);
      expect(find.byIcon(Icons.emoji_events), findsNothing);

      // Verify progress text and indicator
      expect(find.text('進捗: 5 / 10'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);

      // Verify "達成済み!" text is not present
      expect(find.text('達成済み!'), findsNothing);
    });

    testWidgets('renders correctly for an unlocked achievement', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: AchievementItem(achievement: unlockedAchievement))));

      // Verify name and description
      expect(find.text('Unlocked Ach'), findsOneWidget);
      expect(find.text('This is an unlocked achievement.'), findsOneWidget);

      // Verify achievement icon
      expect(find.byIcon(Icons.emoji_events), findsOneWidget);
      expect(find.byIcon(Icons.lock_outline), findsNothing);

      // Verify "達成済み!" text is present
      expect(find.text('達成済み!'), findsOneWidget);

      // Verify progress text and indicator are not present
      expect(find.textContaining('進捗:'), findsNothing);
      expect(find.byType(LinearProgressIndicator), findsNothing);
    });
  });
}
