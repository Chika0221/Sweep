import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sweep/classes/profile.dart';
import 'package:sweep/pages/profile_page/profile_page.dart';
import 'package:sweep/states/profile_provider.dart';

// A mock Profile object for testing
final mockProfile = Profile(
  displayName: 'Test User',
  photoURL: 'https://example.com/test_user.png',
  uid: 'test_uid_123',
  point: 100,
  continuousCount: 5,
  cumulativePoint: 500,
);

void main() {
  testWidgets('ProfilePage displays user information correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          profileProvider.overrideWithValue(mockProfile),
        ],
        child: const MaterialApp(
          home: ProfilePage(),
        ),
      ),
    );

    // Wait for widgets to settle
    await tester.pumpAndSettle();

    // Verify that the AppBar title is correct
    expect(find.text('プロフィール'), findsOneWidget);

    // Verify that the display name is displayed
    expect(find.text('Test User'), findsOneWidget);

    // Verify that the UID is displayed
    expect(find.text('test_uid_123'), findsOneWidget);

    // Verify that the point is displayed
    expect(find.text('100 ポイント'), findsOneWidget);

    // Verify that the continuous count is displayed
    expect(find.text('5 日'), findsOneWidget);

    // Verify that the cumulative point is displayed
    expect(find.text('500 ポイント'), findsOneWidget);

    // Verify that the profile image is displayed
    // We check for the CircleAvatar which should contain the NetworkImage
    expect(find.byType(CircleAvatar), findsOneWidget);
    final CircleAvatar circleAvatar = tester.widget(find.byType(CircleAvatar));
    expect(circleAvatar.backgroundImage, isA<NetworkImage>());
    expect((circleAvatar.backgroundImage as NetworkImage).url, 'https://example.com/test_user.png');

  });

  testWidgets('ProfilePage displays placeholder icon when photoURL is empty', (WidgetTester tester) async {
    final mockProfileNoPhoto = Profile(
      displayName: 'Test User No Photo',
      photoURL: '', // Empty photoURL
      uid: 'test_uid_456',
      point: 50,
      continuousCount: 2,
      cumulativePoint: 200,
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          profileProvider.overrideWithValue(mockProfileNoPhoto),
        ],
        child: const MaterialApp(
          home: ProfilePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that the display name is displayed
    expect(find.text('Test User No Photo'), findsOneWidget);

    // Verify that the placeholder icon is displayed instead of an image
    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byType(CircleAvatar), findsNothing); // No CircleAvatar for image
  });

  testWidgets('ProfilePage displays loading state', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // We don't override profileProvider, so it should be in its initial (null) state
          // or its loading state depending on the provider's internal logic.
          // For this test, we assume it will be null initially before any data.
           profileProvider.overrideWithValue(null),
        ],
        child: const MaterialApp(
          home: ProfilePage(),
        ),
      ),
    );

    // Do not pumpAndSettle, just pump to see the loading state
    await tester.pump();

    // Verify that the CircularProgressIndicator is displayed
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
