import 'package:flutter/material.dart';

import '../model/session.dart';
import '../model/transaction.dart';
import '../model/user.dart';
import '../style/font_style.dart';
import 'add_to_balance.dart';

class WalletView extends StatefulWidget {
  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  User _user = Session.shared.user;

  Widget buildProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(_user.imgPath),
        ),
        SizedBox(
          width: 25.0,
        ),
        Text(_user.firstName + ' ' + _user.lastName, style: headingStyle),
      ],
    );
  }

  Widget buildTransaction(Transaction lastTransaction) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildPaymentInfo(lastTransaction),
            buildTransactionParty(lastTransaction),
          ],
        ),
      ],
    );
  }

  Widget buildTransactionParty(Transaction transaction) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(transaction.party.imagePath),
          ),
        ),
        Text(transaction.party.getName(), style: bodyTextStyle),
      ],
    );
  }

  Widget buildPaymentInfo(Transaction transaction) {
    if (transaction.receivedPayment) {
      return Column(
        children: <Widget>[
          Text('+\$' + transaction.amount.toStringAsFixed(2),
              style: receivingTextStyle),
          Row(
            children: <Widget>[
              Icon(Icons.arrow_back, color: Colors.green),
              Text('From', style: receivingTextStyle),
            ],
          )
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Text('-\$' + transaction.amount.toStringAsFixed(2),
              style: sendingTextStyle),
          Row(
            children: <Widget>[
              Icon(Icons.arrow_forward, color: Colors.red),
              Text('From', style: sendingTextStyle),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: buildProfile(),
          ),
          Card(
            color: Colors.blue,
            margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(30.0),
              leading: Text(
                'Balance: ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              title: Text(
                '\$' + _user.wallet.balance.toStringAsFixed(2),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 75),
            child: RaisedButton(
              color: Colors.white70,
              child: Text(
                'Add to Balance',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddToBalance()),
                );
              },
            ),
          ),
          displayDivider(),
          buildTransaction(_user.wallet.lastTransaction),
        ],
      ),
    );
  }

  Widget displayDivider() {
    return Column(
      children: <Widget>[
        Text('Last Transaction',
            textAlign: TextAlign.left, style: subheadingStyle),
        SizedBox(
          height: 20.0,
          width: 350.0,
          child: Divider(
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
