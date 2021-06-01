part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {}

class NavigationTabChanged extends NavigationEvent {
  final NavigationTab tab;

  NavigationTabChanged({required this.tab});

  @override
  List<Object?> get props => [tab];
}
