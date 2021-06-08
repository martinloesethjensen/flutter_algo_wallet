import 'package:algorand_dart/algorand_dart.dart';
import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  Account? _account;

  Account get account => _account!;

  set account(Account account) {
    _account = account;
    notifyListeners();
  }
}
