class Wallet {
  double _balance;

  Wallet(double balance) {
    this._balance = balance;
  }

  double get balance => _balance;

  set balance(double value) {
    _balance = value;
  }
}
