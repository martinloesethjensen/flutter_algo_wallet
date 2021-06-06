import 'package:algorand_dart/algorand_dart.dart';
import 'package:test/test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'node_test.mocks.dart';

@GenerateMocks([Algorand])
void main() {
  late Algorand algorand;

  setUp(() {
    algorand = MockAlgorand();
  });

  group('Node connection', () {
    test('Node should throw AlgorandException when trying to get node status',
        () {
      // Stubbing method
      when(algorand.status()).thenThrow(AlgorandException);

      expect(() => algorand.status(), throwsA(AlgorandException));
    });

    test('Health should return true', () async {
      // Stubbing method
      when(algorand.health()).thenAnswer((_) => Future.value(true));

      algorand.health();

      verify(algorand.health());

      expect(await algorand.health(), true);
    });

    test('Health should return false', () async {
      // Stubbing method
      when(algorand.health()).thenAnswer((_) => Future.value(false));

      algorand.health();

      // Verify that we have called the `health` method
      verify(algorand.health());

      expect(await algorand.health(), false);
    });
  });
}
