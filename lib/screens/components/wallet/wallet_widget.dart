import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/bottom_navbar/bottom_navbar_provider.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';
import 'package:provider/provider.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final algorand = context.watch<Algorand>();
    final dashboardScreenMode = context.watch<DashboardScreenModeProvider>();
    final account = context.watch<AccountProvider>();
    final navBarProvider = context.watch<BottomNavigationBarProvider>();

    return Padding(
      padding: const EdgeInsets.all(paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            key: Key('CREATE_NEW_WALLET_BUTTON'),
            onPressed: () async {
              final Account createdAccount = await algorand.createAccount();
              account.account = createdAccount;
              dashboardScreenMode.currentWalletStatus =
                  DashboardScreenMode.CREATE_WALLET;

              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('New wallet created.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              // If we create a new wallet from the wallet tab (1) then we should navigate to the dashboard
              if (navBarProvider.currentIndex != 0) {
                navBarProvider.currentIndex = 0;
              }
            },
            child: Text('Create a new wallet'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, 75),
              ),
            ),
          ),
          const VerticalSpacing(of: marginSizeDefault),
          Tooltip(
            message: 'Currently unavailable!',
            child: ElevatedButton(
              key: Key('IMPORT_WALLET_BUTTON'),
              onPressed: () async {
                final restoredAccount =
                    await Account.fromSeedPhrase(seedPhrase);
                account.account = restoredAccount;
                dashboardScreenMode.currentWalletStatus =
                    DashboardScreenMode.LOADED_WALLET;

                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Imported test wallet.'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // If we import a wallet from the wallet tab (1) then we should navigate to the dashboard
                if (navBarProvider.currentIndex != 0) {
                  navBarProvider.currentIndex = 0;
                }
              },
              child: Text('Import existing wallet'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 75),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TODO: Just for testing
// Random Algorand public address
final publicAddress =
    'D3ZUVRXN2KN44O6Z335HI6SOY7WLQW3RNP7HPGTAXBKZWPWKKOZDKJJT5Q';

// Random Algorand seed phrase
final seedPhrase = <String>[
  'certain',
  'social',
  'kidney',
  'magic',
  'special',
  'replace',
  'genuine',
  'meadow',
  'pulse',
  'tennis',
  'unable',
  'obey',
  'urban',
  'clerk',
  'domain',
  'sock',
  'belt',
  'slam',
  'hybrid',
  'tank',
  'lumber',
  'reason',
  'canvas',
  'about',
  'wink'
];
