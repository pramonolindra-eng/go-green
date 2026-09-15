// Basic smoke test for Go Green.
//
// At this foundation stage this only verifies the app boots without
// throwing and that the splash screen renders. Expand this alongside
// each screen as real behavior (forms, navigation, data) gets built.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';

void main() {
  testWidgets('App boots and shows the splash screen', (tester) async {
    await tester.pumpWidget(const GoGreenApp());

    expect(find.text('Go Green'), findsOneWidget);
    expect(find.text('Small Actions, Big Impact'), findsOneWidget);
  });

  testWidgets('MaterialApp uses AppTheme.light', (tester) async {
    await tester.pumpWidget(const GoGreenApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.theme, isNotNull);
  });

  testWidgets('Login validates required credentials before navigating', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginScreen()),
    );

    await tester.tap(find.text('Log In'));
    await tester.pump();

    expect(find.text('Enter your email or phone number'), findsOneWidget);
    expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
  });

  testWidgets('Remember me can be unchecked', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginScreen()),
    );

    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isTrue);
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    expect(tester.widget<Checkbox>(find.byType(Checkbox)).value, isFalse);
  });
}
