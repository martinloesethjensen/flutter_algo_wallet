import 'package:algorand_dart/algorand_dart.dart';
import 'package:mockito/mockito.dart';

class MockHelper {
  final Algorand algorand;

  const MockHelper({required this.algorand});

  healthIsFalse() =>
      when(algorand.health()).thenAnswer((_) => Future.value(true));
}
