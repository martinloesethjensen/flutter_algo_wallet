import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Expanded(child: Container(color: Colors.pink))],
      ),
    );
  }
}
