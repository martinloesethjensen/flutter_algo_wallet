import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_algo_wallet/theme/theme.dart';

class TextClip extends StatelessWidget {
  const TextClip({
    Key? key,
    required this.textToCopy,
    this.snackBarText,
  }) : super(key: key);

  final String textToCopy;
  final String? snackBarText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FlutterClipboard.copy(textToCopy);

        if (snackBarText != null) {
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(snackBarText!),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: textToCopy,
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
    );
  }
}
