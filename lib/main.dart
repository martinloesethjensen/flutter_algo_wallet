import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/routes/route_configuration.dart';
import 'package:flutter_algo_wallet/screens/main_screen.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';

Future<void> main() async {
  // Register the routing
  await RouteConfiguration.register();

  final routeName = MainScreen.routeName;

  runApp(
    AlgoApp(algorand: algorand, initialRoute: routeName),
  );
}

class AlgoApp extends StatelessWidget {
  final Algorand algorand;
  final String initialRoute;

  const AlgoApp({Key? key, required this.algorand, required this.initialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorand Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generator,
      initialRoute: initialRoute,
      home: FutureBuilder<bool>(
          future: algorand.health(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );

            if (!snapshot.data!)
              return Scaffold(
                body: Center(
                  child: Text(
                    'No connection to node',
                    key: Key('NO_NODE_CONNECTION'),
                  ),
                ),
              );
            return MainScreen();
          }),
    );
  }
}
