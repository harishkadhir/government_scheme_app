import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:government_scheme_app/main.dart';

void main() {
  testWidgets('Splash screen displays and navigates to scheme list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Removed const here.

    // Verify that the splash screen is displayed.
    expect(find.text('Welcome to Government Schemes App'), findsOneWidget);

    // Wait for the splash screen duration (3 seconds in your implementation).
    await tester.pumpAndSettle(Duration(seconds: 3));

    // Verify that the scheme list is displayed after the splash screen.
    expect(find.text('Government Schemes'), findsOneWidget);
  });
}