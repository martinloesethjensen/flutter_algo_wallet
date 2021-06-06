import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/screens/main_screen.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final routeName = MainScreen.routeName;

  runApp(
    AlgoApp(initialRoute: routeName),
  );
}

class AlgoApp extends StatelessWidget {
  final String initialRoute;

  const AlgoApp({Key? key, this.initialRoute = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Algorand>(
          create: (_) => ServiceLocator().algorand,
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
