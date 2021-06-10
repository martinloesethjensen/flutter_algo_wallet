import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';

class AlgorandBalance extends StatelessWidget {
  final String balance;

  AlgorandBalance({required this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Image.asset("assets/images/algo_icon.png"),
        ),
        HorizontalSpacing(of: paddingSizeNormal),
        Text(
          this.balance,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
