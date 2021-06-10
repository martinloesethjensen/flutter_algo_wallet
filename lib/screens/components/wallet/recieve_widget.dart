import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/screens/components/text_clip.dart';
import 'package:flutter_algo_wallet/theme/dimens.dart';
import 'package:flutter_algo_wallet/widgets/spacing.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RecieveWidget extends StatelessWidget {
  const RecieveWidget({
    Key? key,
    required this.account,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Recieve'),
      onPressed: () {
        showModalBottomSheet<void>(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(paddingSizeDefault),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    QrImage(
                      data:
                          'https://testnet.algoexplorer.io/address/${account.publicAddress}',
                      version: QrVersions.auto,
                      size: 250,
                      gapless: false,
                      embeddedImage: AssetImage('assets/images/algo_icon.png'),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(80, 80),
                      ),
                    ),
                    const VerticalSpacing(of: marginSizeDefault),
                    TextClip(textToCopy: account.publicAddress),
                    const VerticalSpacing(of: marginSizeDefault),
                    ElevatedButton(
                      child: const Text('Close'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
