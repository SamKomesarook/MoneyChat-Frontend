import 'package:moneychat/model/transaction.dart';

class Wallet {
  double _balance;
  List<Transaction> _transactions;

  Wallet(double balance) {
    this._balance = balance;
    this._transactions = new List<Transaction>();
  }

  // Getter and Setters
  double get balance => _balance;

  set balance(double value) {
    _balance = value;
  }

  List<Transaction> get transactions => _transactions;

  set transactions(List<Transaction> value) {
    _transactions = value;
  }

  void addTransaction(Transaction transaction) {
    if (transaction != null) {
      _transactions.add(transaction);
    }
  }
}
