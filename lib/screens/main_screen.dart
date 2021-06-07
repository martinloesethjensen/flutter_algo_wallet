import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/models/navigation/navigation_tab.dart';
import 'package:flutter_algo_wallet/navigation/navigation_provider.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard.dart';
import 'package:flutter_algo_wallet/screens/profile/profile.dart';
import 'package:flutter_algo_wallet/screens/wallet/wallet.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final tabHandlers = <NavigationTab, Widget>{
    NavigationTab(label: 'Dashboard', icon: Icons.account_balance_outlined):
        DashboardScreen(
      key: Key('DASHBOARD'),
    ),
    NavigationTab(
        label: 'Wallet',
        icon: Icons.indeterminate_check_box_outlined): WalletScreen(),
    NavigationTab(label: 'Profile', icon: Icons.account_box_outlined):
        ProfileScreen(),
  };

  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final algorand = context.watch<Algorand>();
    final tabs = tabHandlers.keys.toList();
    final navBarProvider = context.watch<BottomNavigationBarProvider>();
    final currentIndex = navBarProvider.currentIndex;

    return FutureBuilder<bool>(
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

          return Scaffold(
            body: _widgetOptions.elementAt(currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              onTap: (index) => {navBarProvider.currentIndex = index},
              items: List.generate(
                tabs.length,
                (index) => BottomNavigationBarItem(
                  label: tabs[index].label,
                  icon: Icon(tabs[index].icon),
                ),
              ),
            ),
          );
        });
  }
}
