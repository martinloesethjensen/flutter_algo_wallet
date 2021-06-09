import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter_algo_wallet/account_provider.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../node_test/node_test.mocks.dart';
import 'account_test.mocks.dart';

@GenerateMocks([Account, AccountProvider])
void main() {
  late Account account;
  late Algorand algorand;
  // ignore: unused_local_variable
  late AccountProvider accountProvider;

  // Random Algorand public address
  final publicAddress =
      'D3ZUVRXN2KN44O6Z335HI6SOY7WLQW3RNP7HPGTAXBKZWPWKKOZDKJJT5Q';

  // Random Algorand seed phrase
  final seedPhrase = <String>[
    'certain',
    'social',
    'kidney',
    'magic',
    'special',
    'replace',
    'genuine',
    'meadow',
    'pulse',
    'tennis',
    'unable',
    'obey',
    'urban',
    'clerk',
    'domain',
    'sock',
    'belt',
    'slam',
    'hybrid',
    'tank',
    'lumber',
    'reason',
    'canvas',
    'about',
    'wink'
  ];

  setUp(() {
    account = MockAccount();
    algorand = MockAlgorand();
    accountProvider = MockAccountProvider();
  });

  group('Algorand account', () {
    test('Should create a new algorand account', () async {
      // Mocking stubs and their return values
      when(algorand.createAccount()).thenAnswer((_) => Future.value(account));
      when(account.publicAddress).thenReturn(publicAddress);
      when(account.seedPhrase).thenAnswer((_) => Future.value(seedPhrase));

      final _account = await algorand.createAccount();
      final _seedPhrase = await _account.seedPhrase;

      // Verifying calls
      verify(await algorand.createAccount());
      verify(await _account.seedPhrase);

      expect(_account.publicAddress, publicAddress);
      expect(_seedPhrase, seedPhrase);
    });
  });
}
