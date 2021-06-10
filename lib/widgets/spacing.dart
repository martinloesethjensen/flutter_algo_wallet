import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;

  const VerticalSpacing({this.of = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: of,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double of;

  const HorizontalSpacing({this.of = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: of,
    );
  }
}
