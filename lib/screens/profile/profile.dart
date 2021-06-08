import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: OutlinedButton(
            key: Key('FUND_ACCOUNT'),
            onPressed: () async {
              await launch(
                'https://bank.testnet.algorand.network/?account=${'test'}', // TODO: account.publicAddress
                forceWebView: true,
                enableJavaScript: true,
              );
            },
            child: Text('Fund Account'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, 75),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
