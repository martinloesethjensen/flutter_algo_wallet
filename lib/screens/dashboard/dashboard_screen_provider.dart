import 'package:flutter/material.dart';

class DashboardScreenModeProvider with ChangeNotifier {
  DashboardScreenMode _initialWalletStatus = DashboardScreenMode.CREATE_WALLET;

  DashboardScreenMode get currentWalletStatus => _initialWalletStatus;
}

enum DashboardScreenMode {
  NO_WALLET,
  CREATE_WALLET,
  IMPORT_WALLET,
  LOADED_WALLET
}
