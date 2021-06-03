import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/routes/route_configuration.dart';
import 'package:flutter_algo_wallet/screens/main_screen.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Register the routing
  await RouteConfiguration.register();

  final routeName = MainScreen.routeName;

  runApp(
    Provider<Algorand>(
      create: (_) => ServiceLocator().algorand,
      child: AlgoApp(
        initialRoute: routeName,
      ),
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
      onGenerateRoute: router.generator,
      initialRoute: initialRoute,
    );
  }
}
