import 'package:flutter/material.dart';

/// Inject & provide the dashboard
Widget provideDashboardPage() {
  return Container(color: Colors.green);
  // return BlocProvider<DashboardBloc>(
  //   create: (_) => DashboardBloc(accountRepository: accountRepository)..start(),
  //   child: DashboardPage(),
  // );
}
