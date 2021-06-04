import 'package:flutter/material.dart';

/// Inject & provide the profile
Widget provideProfilePage() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[Expanded(child: Container(color: Colors.black))],
    ),
  );
  // return BlocProvider<ProfileBloc>(
  //   create: (_) => ProfileBloc(accountRepository: accountRepository)..start(),
  //   child: ProfilePage(),
  // );
}
