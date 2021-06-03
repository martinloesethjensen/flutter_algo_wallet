import 'package:flutter/material.dart';

/// Inject & provide the profile
Widget provideProfilePage() {
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
  // return BlocProvider<ProfileBloc>(
  //   create: (_) => ProfileBloc(accountRepository: accountRepository)..start(),
  //   child: ProfilePage(),
  // );
}
