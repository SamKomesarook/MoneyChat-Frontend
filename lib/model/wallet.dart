import 'package:moneychat/model/transaction.dart';

class Wallet {
  double _balance;
  Transaction _lastTransaction;

  Wallet(double balance) {
    this._balance = balance;
  }

  // Getter and Setters
  double get balance => _balance;

  set balance(double value) {
    _balance = value;
  }

  Transaction get lastTransaction => _lastTransaction;

  set lastTransaction(Transaction value) {
    _lastTransaction = value;
  }
}
