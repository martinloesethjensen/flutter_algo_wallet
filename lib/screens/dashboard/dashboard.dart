import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
            key: Key('CREATE_NEW_WALLET_BUTTON'),
            onPressed: () {}, // TODO
            child: Text('Create a new wallet'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, 75),
              ),
            ),
          ),
          SizedBox(width: 10),
          OutlinedButton(
            key: Key('IMPORT_WALLET_BUTTON'),
            onPressed: () {}, // TODO
            child: Text('Import existing wallet'),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(double.infinity, 75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
