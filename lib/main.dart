import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Algorand>(
          create: (context) => ServiceLocator().algorand,
        ),
      ],
      child: AlgoApp(),
    ),
  );
}

class AlgoApp extends StatelessWidget {
  const AlgoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _algorand = context.watch<Algorand>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
          future: _algorand.health(),
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

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Import or create wallet'),
      ),
      body: Center(
        child: Row(
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
        ),
      ),
    );
  }
}
