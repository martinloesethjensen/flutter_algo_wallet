import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/bloc/navigation_bloc.dart';
import 'package:flutter_algo_wallet/models/navigation/navigation_tab.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard.dart';
import 'package:flutter_algo_wallet/screens/profile/profile.dart';
import 'package:flutter_algo_wallet/screens/wallet/wallet.dart';
import 'package:flutter_algo_wallet/services/service_locator.dart';
import 'package:provider/provider.dart';

final tabHandlers = <NavigationTab, Widget>{
  NavigationTab(label: 'Dashboard', icon: Icons.house_outlined):
      provideDashboardPage(),
  NavigationTab(label: 'Wallet', icon: Icons.wallet_giftcard_outlined):
      provideWalletPage(),
  NavigationTab(label: 'Profile', icon: Icons.person_add_alt_outlined):
      provideProfilePage(),
};

final tabs = tabHandlers.keys.toList();

class MainScreen extends StatelessWidget {
  static final String routeName = '/';

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final algorand = context.watch<Algorand>();

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
            body: SafeArea(
              child: Builder(
                builder: (BuildContext context) {
                  final navigationTab =
                      context.watch<NavigationBloc>().currentTab;
                  final index = tabs.indexOf(navigationTab);

                  return IndexedStack(
                    index: index,
                    children: tabHandlers.values.toList(),
                  );
                },
              ),
            ),
            bottomNavigationBar: Builder(builder: (context) {
              final navigationTab = context.watch<NavigationBloc>().currentTab;
              final index = tabs.indexOf(navigationTab);

              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: index,
                onTap: (index) =>
                    context.read<NavigationBloc>().changeTab(tabs[index]),
                items: List.generate(
                  tabs.length,
                  (index) => BottomNavigationBarItem(
                    label: tabs[index].label,
                    icon: Icon(tabs[index].icon),
                  ),
                ),
              );
            }),
          );
        });
  }
}
