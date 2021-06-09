import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../node_test/node_test.mocks.dart';
import '../test_utils.dart';
import 'create_account_test.mocks.dart';

Future<void> main() async {
  late AccountProvider accountProvider;
  late Algorand algorand;
  late DashboardScreenModeProvider dashboardScreenModeProvider;
  late Account account;

  setUp(() {
    accountProvider = AccountProvider();
    algorand = MockAlgorand();
    dashboardScreenModeProvider = DashboardScreenModeProvider();
    account = MockAccount();
  });

  testWidgets("Should show public key in widget after pressing 'create wallet'",
      (WidgetTester tester) async {
    when(algorand.health()).thenAnswer((_) => Future.value(true));
    when(algorand.createAccount()).thenAnswer((_) => Future.value(account));
    when(accountProvider.account).thenReturn(account);
    when(accountProvider.account.publicKey).thenReturn(account.publicKey);
    when(accountProvider.account.seedPhrase).thenReturn(account.seedPhrase);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      appWithProviders(
        injectedAlgorand: algorand,
        injectedAccount: accountProvider,
        injectedDashboardScreenMode: dashboardScreenModeProvider,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(Key('CREATE_NEW_WALLET_BUTTON')), findsOneWidget);
    await tester.tap(find.byKey(Key('CREATE_NEW_WALLET_BUTTON')));

    await tester.pumpAndSettle();
  });
}
