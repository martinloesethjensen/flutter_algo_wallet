import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_algo_wallet/screens/main_screen/main_screen.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'bottom_navbar/bottom_navbar_provider.dart';
import 'global_providers/account/account_provider.dart';

Future<void> main() async {
  final routeName = MainScreen.routeName;

  runApp(
    MultiProvider(
      providers: [
        Provider<Algorand>(create: (_) => ServiceLocator().algorand),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => DashboardScreenModeProvider()),
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: AlgoApp(initialRoute: routeName),
    ),
  );
}

class AlgoApp extends StatelessWidget {
  final String initialRoute;

  const AlgoApp({Key? key, this.initialRoute = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorand Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case MainScreen.routeName:
            page = MainScreen();
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      initialRoute: initialRoute,
    );
  }
}
