// Imports the Flutter Driver API.
import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final noNodeConnectionTextFinder = find.byValueKey('NO_NODE_CONNECTION');
    final createWalletButtonFinder =
        find.byValueKey('CREATE_NEW_WALLET_BUTTON');
    final importWalletButtonFinder =
        find.byValueKey('CREATE_NEW_WALLET_BUTTON');

    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test('Description', () async {
      driver.requestData('healthIsFalse');

      expect(await driver.getText(noNodeConnectionTextFinder),
          'No connection to node');
    });
  });
}
