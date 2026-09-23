// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:room8/main.dart';

void main() {
  testWidgets('LiveDemoForm renders Room 8 title and heading',
      (WidgetTester tester) async {
    // Build the form and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: LiveDemoForm()));

    // Verify the AppBar title and the page heading both show "Room 8".
    expect(find.text('Room 8'), findsNWidgets(2));
    expect(find.byType(AppBar), findsOneWidget);
  });
}
