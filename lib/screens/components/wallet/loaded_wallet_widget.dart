import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/global_providers/account/account_provider.dart';
import 'package:flutter_algo_wallet/screens/components/algorand/algorand_balance.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';
import 'package:provider/provider.dart';

class LoadedWalletWidget extends StatelessWidget {
  const LoadedWalletWidget();

  @override
  Widget build(BuildContext context) {
    final algorand = context.watch<Algorand>();
    final account = context.watch<AccountProvider>().account;
    return Padding(
      padding: const EdgeInsets.all(paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          VerticalSpacing(of: paddingSizeDefault),
          FutureBuilder<AccountInformation>(
            future: algorand.getAccountByAddress(account.publicAddress),
            builder: (context, informationSnapshot) {
              if (informationSnapshot.hasError) {
                return Text(informationSnapshot.error.toString());
              }
              if (!informationSnapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final accountInformation = informationSnapshot.data!;
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(paddingSizeSmall),
                  child: _buildTotalBalance(
                    context,
                    accountInformation.amountWithoutPendingRewards,
                    accountInformation.pendingRewards,
                    account,
                  ),
                ),
              );
            },
          ),
          VerticalSpacing(of: paddingSizeNormal),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Tooltip(
                  message: 'Currently not supported!',
                  child: ElevatedButton(
                    onPressed: null,
                    child: Text('Send'),
                  ),
                ),
              ),
              HorizontalSpacing(of: paddingSizeNormal),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Recieve'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Build the total balance
  Widget _buildTotalBalance(
      BuildContext context, int amount, int pendingRewards, Account account) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingSizeDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Total balance',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Palette.subtitleColor,
                    ),
              ),
            ],
          ),
          VerticalSpacing(of: marginSizeSmall),
          AlgorandBalance(
            balance: Algo.fromMicroAlgos(amount).toString(),
          ),
          VerticalSpacing(of: marginSizeDefault),
          Text(
            'Pending Rewards',
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Palette.subtitleColor,
                ),
          ),
          VerticalSpacing(of: marginSizeSmall),
          AlgorandBalance(
            balance: Algo.fromMicroAlgos(pendingRewards).toString(),
          ),
        ],
      ),
    );
  }
}
