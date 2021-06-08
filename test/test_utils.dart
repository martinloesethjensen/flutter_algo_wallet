import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter_algo_wallet/main.dart';
import 'package:flutter_algo_wallet/navigation/navigation_provider.dart';
import 'package:flutter_algo_wallet/screens/main_screen.dart';
import 'package:provider/provider.dart';

import 'node_test/node_test.mocks.dart';

appWithProviders({
  injectedAlgorand,
  BottomNavigationBarProvider? injectedBottomNavBar,
}) =>
    MultiProvider(
      providers: [
        Provider<Algorand>(
          create: (_) => injectedAlgorand ?? MockAlgorand(),
        ),
        ChangeNotifierProvider(
          create: (_) => injectedBottomNavBar ?? BottomNavigationBarProvider(),
        ),
      ],
      child: AlgoApp(
        initialRoute: MainScreen.routeName,
      ),
    );
