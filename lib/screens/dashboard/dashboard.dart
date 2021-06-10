import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/screens/components/create_account_widget.dart';
import 'package:flutter_algo_wallet/screens/components/import_account_widget.dart';
import 'package:flutter_algo_wallet/screens/components/loaded_wallet_widget.dart';
import 'package:flutter_algo_wallet/screens/components/wallet_widget.dart';
import 'package:provider/provider.dart';

import 'dashboard_screen_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardScreen = context.watch<DashboardScreenModeProvider>();
    return Center(
      child: getDashboardScreen(dashboardScreen.currentWalletStatus),
    );
  }

  Widget getDashboardScreen(DashboardScreenMode dashboardScreenMode) {
    switch (dashboardScreenMode) {
      case DashboardScreenMode.NO_WALLET:
        return WalletWidget();
      case DashboardScreenMode.CREATE_WALLET:
        return CreateWalletWidget();
      case DashboardScreenMode.IMPORT_WALLET:
        return ImportWalletWidget();
      case DashboardScreenMode.LOADED_WALLET:
        return LoadedWalletWidget();
      default:
        return WalletWidget();
    }
  }
}
