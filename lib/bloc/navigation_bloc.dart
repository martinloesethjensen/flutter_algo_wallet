import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/models/navigation/navigation_tab.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationTab> {
  NavigationBloc(NavigationTab tab) : super(tab);

  void changeTab(NavigationTab tab) {
    add(NavigationTabChanged(tab: tab));
  }

  @override
  Stream<NavigationTab> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationTabChanged) {
      yield event.tab;
    }
  }

  NavigationTab get currentTab => state;
}
