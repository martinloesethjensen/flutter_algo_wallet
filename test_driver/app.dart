import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/main.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:provider/provider.dart';

import '../test/node_test/node_test.mocks.dart';
import 'mock_helper.dart';

void main() {
  final mockAlgorand = MockAlgorand();
  final mockHelper = MockHelper(algorand: mockAlgorand);

  // ignore: missing_return
  Future<String> dataHandler(String? msg) async {
    switch (msg) {
      case 'healthIsFalse':
        {
          mockHelper.healthIsFalse();
        }
        break;
      default:
        break;
    }
    return '';
  }

  // This line enables the extension.
  enableFlutterDriverExtension(handler: dataHandler);

  // Call the `main()` function of the app, or call `runApp` with
  // any widget you are interested in testing.
  runApp(
    Provider<Algorand>(
      create: (_) => mockAlgorand,
      child: AlgoApp(),
    ),
  );
}
