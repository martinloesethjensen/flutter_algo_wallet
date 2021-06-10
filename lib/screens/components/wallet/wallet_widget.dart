import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
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
              onPressed: null, // TODO
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
