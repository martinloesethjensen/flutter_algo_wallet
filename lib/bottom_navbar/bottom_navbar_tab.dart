import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationTab extends Equatable {
  final String label;
  final IconData icon;

  NavigationTab({
    required this.label,
    required this.icon,
  });

  @override
  List<Object?> get props => [label, icon];
}
