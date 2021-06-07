import 'package:flutter_algo_wallet/navigation/navigation_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BottomNavigationBarProvider navBarProvider;

  setUp(() {
    navBarProvider = BottomNavigationBarProvider();
  });
  group('Bottom Navigation', () {
    test('Start bottom navigation tab on 0', () {
      expect(navBarProvider.currentIndex, 0);
    });

    test('Should change bottom navigation tab', () {
      // Make sure currentIndex is default value
      expect(navBarProvider.currentIndex, 0);

      // Change to different tab index value
      navBarProvider.currentIndex = 1;

      expect(navBarProvider.currentIndex, 1);
    });
  });
}
