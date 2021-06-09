// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/navigation/navigation_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../node_test/node_test.mocks.dart';
import '../test_utils.dart';
import 'account_test.mocks.dart';

Future<void> main() async {
  // ignore: unused_local_variable
  late Account account;
  late Algorand algorand;
  late BottomNavigationBarProvider navBarProvider;

  setUp(() {
    account = MockAccount();
    algorand = MockAlgorand();
    navBarProvider = BottomNavigationBarProvider();
  });

  testWidgets(
      'Should show public address, seed phrase, and fund account button',
      (WidgetTester tester) async {
    when(algorand.health()).thenAnswer((_) => Future.value(true));

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      appWithProviders(
        injectedAlgorand: algorand,
        injectedBottomNavBar: navBarProvider,
      ),
    );

    // Check that we show spinner when we wait for data
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    // Change to profile tab
    navBarProvider.currentIndex = 2;
    // Make sure currentIndex is 2
    expect(navBarProvider.currentIndex, 2);

    await tester.pumpAndSettle();

    expect(find.byKey(Key('FUND_ACCOUNT')), findsOneWidget);
  });
}
