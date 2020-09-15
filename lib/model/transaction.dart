import 'contact.dart';

class Transaction {
  Contact _party;
  double _amount;
  bool _receivedPayment;

  Transaction(Contact party, double amount, bool receivedPayment) {
    _party = party;
    _amount = amount;
    _receivedPayment = receivedPayment;
  }

  // Getter and Setters
  bool get receivedPayment => _receivedPayment;

  set receivedPayment(bool value) {
    _receivedPayment = value;
  }

  double get amount => _amount;

  set amount(double value) {
    _amount = value;
  }

  Contact get party => _party;

  set party(Contact value) {
    _party = value;
  }
}
