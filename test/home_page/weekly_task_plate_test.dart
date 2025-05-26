// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:sweep/pages/home_page/weekly_task_plate.dart';

void main() {
  testWidgets('WeeklyTaskPlate renders title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: WeeklyTaskPlate(),
          ),
        ),
      ),
    );

    expect(find.text('ウィークリータスク'), findsOneWidget);
  });

  testWidgets('WeeklyTaskPlate renders all example tasks', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: WeeklyTaskPlate(),
          ),
        ),
      ),
    );

    expect(find.text('ゴミを拾う'), findsOneWidget);
    expect(find.text('新しい場所を開拓する'), findsOneWidget);
    expect(find.text('フレンドに挨拶する'), findsOneWidget);
  });

  testWidgets('WeeklyTaskPlate checkbox toggles state', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: Scaffold(
            body: WeeklyTaskPlate(),
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
