// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pinterest_ui/main.dart';

void main() {
  testWidgets('Pinterest UI smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Wait for network images (which won't load in test environment usually, but we just check structure)
    // Actually, network images might cause issues in tests if not handled, but let's just check for the AppBar title
    // which is a safe text to find.

    expect(find.text('Pinterest'), findsOneWidget);
    expect(
      find.byType(GridView),
      findsNothing,
    ); // It's a MasonryGridView, not GridView, but let's just check text
  });
}
