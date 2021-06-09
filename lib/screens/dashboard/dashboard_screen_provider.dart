import 'package:flutter/material.dart';

class DashboardScreenModeProvider with ChangeNotifier {
  DashboardScreenMode _initialWalletStatus = DashboardScreenMode.NO_WALLET;

  DashboardScreenMode get currentWalletStatus => _initialWalletStatus;

  set currentWalletStatus(DashboardScreenMode dashboardScreenMode) {
    _initialWalletStatus = dashboardScreenMode;
    notifyListeners();
  }
}

enum DashboardScreenMode {
  NO_WALLET,
  CREATE_WALLET,
  IMPORT_WALLET,
  LOADED_WALLET
}
