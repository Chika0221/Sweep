import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/pages/home_page/daily_task_plate.dart';

void main() {
  testWidgets('DailyTaskPlate renders title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: DailyTaskPlate(),
          ),
        ),
      ),
    );

    expect(find.text('デイリータスク'), findsOneWidget);
  });

  testWidgets('DailyTaskPlate renders all example tasks', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: DailyTaskPlate(),
          ),
        ),
      ),
    );

    expect(find.text('ログインする'), findsOneWidget);
    expect(find.text('日記を書く'), findsOneWidget);
    expect(find.text('今日の歩数を記録する'), findsOneWidget);
  });

  testWidgets('DailyTaskPlate checkbox toggles state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: DailyTaskPlate(),
          ),
        ),
      ),
    );

    // Find the first checkbox
    final checkboxFinder = find.byType(Checkbox).first;
    
    // Verify initial state is false
    Checkbox checkbox = tester.widget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isFalse);

    // Tap the checkbox
    await tester.tap(checkboxFinder);
    await tester.pump(); // Rebuild the widget with the new state

    // Verify state is true after tap
    checkbox = tester.widget<Checkbox>(checkboxFinder);
    expect(checkbox.value, isTrue);
  });
}
