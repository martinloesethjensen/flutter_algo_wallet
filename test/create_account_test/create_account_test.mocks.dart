// Mocks generated by Mockito 5.0.9 from annotations
// in flutter_algo_wallet/test/create_account_test/create_account_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:algorand_dart/src/models/accounts/account_model.dart' as _i5;
import 'package:algorand_dart/src/models/addresses/address_model.dart' as _i4;
import 'package:cryptography/src/cryptography/simple_key_pair.dart' as _i3;
import 'package:cryptography/src/cryptography/simple_public_key.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeSimplePublicKey extends _i1.Fake implements _i2.SimplePublicKey {}

class _FakeSimpleKeyPair extends _i1.Fake implements _i3.SimpleKeyPair {}

class _FakeAddress extends _i1.Fake implements _i4.Address {}

/// A class which mocks [Account].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccount extends _i1.Mock implements _i5.Account {
  MockAccount() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.SimplePublicKey get publicKey =>
      (super.noSuchMethod(Invocation.getter(#publicKey),
          returnValue: _FakeSimplePublicKey()) as _i2.SimplePublicKey);
  @override
  _i3.SimpleKeyPair get keyPair =>
      (super.noSuchMethod(Invocation.getter(#keyPair),
          returnValue: _FakeSimpleKeyPair()) as _i3.SimpleKeyPair);
  @override
  _i4.Address get address => (super.noSuchMethod(Invocation.getter(#address),
      returnValue: _FakeAddress()) as _i4.Address);
  @override
  String get publicAddress =>
      (super.noSuchMethod(Invocation.getter(#publicAddress), returnValue: '')
          as String);
  @override
  _i6.Future<List<String>> get seedPhrase =>
      (super.noSuchMethod(Invocation.getter(#seedPhrase),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
}