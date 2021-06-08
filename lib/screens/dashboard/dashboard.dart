import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardScreenModeProvider dashboardScreen =
        context.watch<DashboardScreenModeProvider>();
    print(dashboardScreen.currentWalletStatus);
    return Center(
        child: (() {
      switch (dashboardScreen.currentWalletStatus) {
        case DashboardScreenMode.NO_WALLET:
          return NoWalletWidget();
        case DashboardScreenMode.CREATE_WALLET:
          return CreateWalletWidget();
        case DashboardScreenMode.IMPORT_WALLET:
          return ImportWalletWidget();
      }
    }()));
  }
}

class NoWalletWidget extends StatelessWidget {
  const NoWalletWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlinedButton(
          key: Key('CREATE_NEW_WALLET_BUTTON'),
          onPressed: () {}, // TODO
          child: Text('Create a new wallet'),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 75),
            ),
          ),
        ),
        SizedBox(width: 10),
        OutlinedButton(
          key: Key('IMPORT_WALLET_BUTTON'),
          onPressed: () {}, // TODO
          child: Text('Import existing wallet'),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 75),
            ),
          ),
        ),
      ],
    );
  }
}

class CreateWalletWidget extends StatelessWidget {
  const CreateWalletWidget();

  @override
  Widget build(BuildContext context) {
    final algorand = context.watch<Algorand>();
    var account = context.watch<AccountProvider>();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Account: ${account.account.publicKey}"),
          OutlinedButton(
            onPressed: () async {
              final Account createdAccount = await algorand.createAccount();
              account.account = createdAccount;
            },
            child: Text("test"),
          )
        ],
      ),
    );
  }
}

class ImportWalletWidget extends StatelessWidget {
  const ImportWalletWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(),
    );
  }
}
