import 'package:flutter/material.dart';

/// Inject & provide the dashboard
Widget provideDashboardPage() {
  return Center(
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
  );
  // return BlocProvider<DashboardBloc>(
  //   create: (_) => DashboardBloc(accountRepository: accountRepository)..start(),
  //   child: DashboardPage(),
  // );
}