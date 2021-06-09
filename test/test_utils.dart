import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter_algo_wallet/bottom_navbar/bottom_navbar_provider.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/main.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_algo_wallet/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

import 'node_test/node_test.mocks.dart';

appWithProviders({
  injectedAlgorand,
  BottomNavigationBarProvider? injectedBottomNavBar,
  AccountProvider? injectedAccount,
  DashboardScreenModeProvider? injectedDashboardScreenMode,
}) =>
    MultiProvider(
      providers: [
        Provider<Algorand>(
          create: (_) => injectedAlgorand ?? MockAlgorand(),
        ),
        ChangeNotifierProvider(
          create: (_) => injectedBottomNavBar ?? BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => injectedAccount ?? AccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              injectedDashboardScreenMode ?? DashboardScreenModeProvider(),
        )
      ],
      child: AlgoApp(
        initialRoute: MainScreen.routeName,
      ),
    );
