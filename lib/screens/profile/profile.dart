import 'package:flutter/material.dart';

/// Inject & provide the profile
Widget provideProfilePage() {
  return Container(color: Colors.pink);
  // return BlocProvider<ProfileBloc>(
  //   create: (_) => ProfileBloc(accountRepository: accountRepository)..start(),
  //   child: ProfilePage(),
  // );
}
