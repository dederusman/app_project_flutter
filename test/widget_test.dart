// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_dederusman/main.dart';

void main() {
  testWidgets('Login and Dashboard Navigation Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the login page is displayed.
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // Username dan Password

    // Enter username and password
    await tester.enterText(find.byType(TextField).at(0), 'user'); // Username
    await tester.enterText(find.byType(TextField).at(1), 'pass'); // Password

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pump(); // Trigger a frame

    // Verify that we are now on the Dashboard page
    expect(find.text('Selamat datang, user!'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget); // Memastikan ada BottomNavigationBar
  });
}