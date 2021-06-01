import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/bloc/navigation_bloc.dart';
import 'package:flutter_algo_wallet/screens/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var rootHandler = Handler(
  type: HandlerType.route,
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<MainBloc>(
        //   create: (_) => {}, //MainBloc(accountRepository: accountRepository),
        // ),
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(tabs[0]),
        ),
      ],
      child: MainScreen(),
    );
  },
);
