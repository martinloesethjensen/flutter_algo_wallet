import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/screens/dashboard/dashboard_screen_provider.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';
import 'package:provider/provider.dart';

class CreateWalletWidget extends StatelessWidget {
  const CreateWalletWidget();

  @override
  Widget build(BuildContext context) {
    final loadedAccount = context.watch<AccountProvider>();
    final dashboardScreenMode = context.watch<DashboardScreenModeProvider>();

    return Padding(
      padding: const EdgeInsets.all(paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Public Address',
            style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
          ),
          const VerticalSpacing(of: marginSizeSmall),
          Text(
            '${loadedAccount.account.publicAddress}',
            style: regularTextStyle.copyWith(fontSize: fontSizeSmall),
          ),
          const VerticalSpacing(of: marginSizeDefault),
          Text(
            'Mnemonic Phrase',
            style: boldTextStyle.copyWith(fontSize: fontSizeMedium),
          ),
          const VerticalSpacing(of: marginSizeSmall),
          FutureBuilder<List>(
            future: loadedAccount.account.seedPhrase,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data?.join(', ')}',
                style: regularTextStyle.copyWith(fontSize: fontSizeSmall),
              );
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              dashboardScreenMode.currentWalletStatus =
                  DashboardScreenMode.LOADED_WALLET;
            },
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}
