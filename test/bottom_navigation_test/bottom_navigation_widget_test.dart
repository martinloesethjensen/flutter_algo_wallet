// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/bottom_navbar/bottom_navbar_provider.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';

import '../account_test/account_test.mocks.dart';
import '../node_test/node_test.mocks.dart';
import '../test_utils.dart';

Future<void> main() async {
  late Algorand algorand;
  late BottomNavigationBarProvider navBarProvider;
  // ignore: unused_local_variable
  late AccountProvider accountProvider;
  // ignore: unused_local_variable
  late Account account;

  setUp(() {
    account = MockAccount();
    algorand = MockAlgorand();
    navBarProvider = BottomNavigationBarProvider();
  });

  testWidgets('Should change bottom navigation tab',
      (WidgetTester tester) async {
    when(algorand.health()).thenAnswer((_) => Future.value(true));

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      appWithProviders(
        injectedAlgorand: algorand,
        injectedBottomNavBar: navBarProvider,
      ),
    );

    await tester.pumpAndSettle();

    // Make sure currentIndex is 0
    expect(navBarProvider.currentIndex, 0);

    expect(find.byKey(Key('DASHBOARD')), findsOneWidget);

    final finder = find.byTooltip('Profile');

    await tester.tap(finder);

    await tester.pumpAndSettle();

    expect(find.byKey(Key('PROFILE')), findsOneWidget);

    expect(navBarProvider.currentIndex, 2);
  });
}
