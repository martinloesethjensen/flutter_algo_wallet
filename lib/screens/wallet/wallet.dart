import 'package:flutter/material.dart';

/// Inject & provide the wallet screen
Widget provideWalletPage() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Expanded(child: Container(color: Colors.pink))],
    ),
  );
  // return BlocProvider(
  //   create: (_) => WalletBloc(accountRepository: accountRepository)..start(),
  //   child: WalletPage(),
  // );
}
