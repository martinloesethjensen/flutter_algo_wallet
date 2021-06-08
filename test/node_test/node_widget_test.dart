// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../test_utils.dart';
import 'node_test.mocks.dart';

Future<void> main() async {
  late Algorand algorand;

  setUp(() {
    algorand = MockAlgorand();
  });

  testWidgets(
      'Should show options for import and create wallet buttons when there is node connection',
      (WidgetTester tester) async {
    when(algorand.health()).thenAnswer((_) => Future.value(true));

    // Build our app and trigger a frame.
    await tester.pumpWidget(appWithProviders(injectedAlgorand: algorand));

    // Check that we show spinner when we wait for data
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('Create a new wallet'), findsOneWidget);
    expect(find.text('Import existing wallet'), findsOneWidget);
  });

  testWidgets(
      'Should show no connection text when there is no connection to the node',
      (WidgetTester tester) async {
    when(algorand.health()).thenAnswer((_) => Future.value(false));

    // Build our app and trigger a frame.
    await tester.pumpWidget(appWithProviders(injectedAlgorand: algorand));

    // Check that we show spinner when we wait for data
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    // Verify that we are showing no node connection text
    expect(find.byKey(Key('NO_NODE_CONNECTION')), findsOneWidget);
  });
}
