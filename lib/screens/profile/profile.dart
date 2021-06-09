import 'package:algorand_dart/algorand_dart.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/account_provider.dart';
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

    if (dashboardProvider.currentWalletStatus !=
        DashboardScreenMode.LOADED_WALLET) {
      // TODO: MIDGET TEST THIS
      return Container(
        child: Center(
          child: Text('No account created or wallet'),
        ),
      );
    }

    return Builder((context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Account address
            Text(
              'Account',
              style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
            ),
            VerticalSpacing(of: marginSizeSmall),
            GestureDetector(
              onTap: () async {
                await FlutterClipboard.copy(account.publicAddress);

                final snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('Algorand address copied to clipboard'),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: account.publicAddress,
                      style: regularTextStyle.copyWith(fontSize: fontSizeSmall),
                    ),
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.copy,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            VerticalSpacing(of: marginSizeDefault),

            /// Seed phrase
            Text(
              'Word list',
              style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
            ),
            VerticalSpacing(of: marginSizeSmall),
            FutureBuilder<List<String>>(
                future: account.seedPhrase,
                initialData: <String>[],
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  final seedPhrase = (snapshot.data ?? <String>[]).join(' ');
                  return GestureDetector(
                    onTap: () async {
                      await FlutterClipboard.copy(seedPhrase);

                      final snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Word list copied to clipboard'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: seedPhrase,
                            style: regularTextStyle.copyWith(
                                fontSize: fontSizeSmall),
                          ),
                          WidgetSpan(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.copy,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
    });
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
