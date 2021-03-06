import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/screens/components/text_clip.dart';
import 'package:flutter_algo_wallet/screens/components/wallet/wallet_widget.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardScreenModeProvider>();

    // If a wallet has not been loaded then we should show the wallet.
    if (dashboardProvider.currentWalletStatus !=
        DashboardScreenMode.LOADED_WALLET) {
      return WalletWidget();
    }

    final accountProvider = context.watch<AccountProvider>();
    final account = accountProvider.account;

    return Padding(
      padding: const EdgeInsets.all(paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Account address
          Text(
            'Account',
            style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
          ),
          const VerticalSpacing(of: marginSizeSmall),
          TextClip(
            textToCopy: account.publicAddress,
            snackBarText: 'Algorand address copied to clipboard',
          ),

          const VerticalSpacing(of: marginSizeDefault),

          /// Seed phrase
          Text(
            'Word list',
            style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
          ),
          const VerticalSpacing(of: marginSizeSmall),
          FutureBuilder<List<String>>(
              future: account.seedPhrase,
              initialData: <String>[],
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();

                final seedPhrase = (snapshot.data ?? <String>[]).join(' ');
                return TextClip(
                  textToCopy: seedPhrase,
                  snackBarText: 'Word list copied to clipboard',
                );
              }),

          Spacer(),

          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 50),
            child: ElevatedButton(
              key: Key('FUND_ACCOUNT'),
              child: Text('Fund Account'),
              onPressed: () async {
                await launch(
                  'https://bank.testnet.algorand.network/?account=${account.publicAddress}',
                  forceWebView: true,
                  enableJavaScript: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Random Algorand public address
final publicAddress =
    'D3ZUVRXN2KN44O6Z335HI6SOY7WLQW3RNP7HPGTAXBKZWPWKKOZDKJJT5Q';

// Random Algorand seed phrase
final seedPhrase = <String>[
  'certain',
  'social',
  'kidney',
  'magic',
  'special',
  'replace',
  'genuine',
  'meadow',
  'pulse',
  'tennis',
  'unable',
  'obey',
  'urban',
  'clerk',
  'domain',
  'sock',
  'belt',
  'slam',
  'hybrid',
  'tank',
  'lumber',
  'reason',
  'canvas',
  'about',
  'wink'
];
