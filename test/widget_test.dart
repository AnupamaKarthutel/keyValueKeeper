import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keyvalue_keeper/presentation/pages/home_page.dart';

void main() {
  testWidgets('Test for FloatingActionButton', (WidgetTester tester) async {
    // Build the app widget
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(), // Replace with your home widget
      ),
    );

    // Verify the initial state
    expect(find.text('Initial Text'), findsOneWidget);

    // Tap the FloatingActionButton
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump(); // Rebuild the widget tree

    // Verify the state after tapping the button
    expect(find.text('Updated Text'), findsOneWidget);
  });
}
