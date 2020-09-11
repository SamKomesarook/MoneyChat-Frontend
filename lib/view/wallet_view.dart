import 'package:flutter/material.dart';

import '../model/session.dart';
import '../model/user.dart';
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
        Text(
          _user.firstName + ' ' + _user.lastName,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
              padding: const EdgeInsets.symmetric(vertical: 25.0),
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
          ],
        ),
      ),
    );
  }

  Widget displayDivider() {
    return SizedBox(
      height: 20.0,
      width: 350.0,
      child: Divider(
        color: Colors.blueGrey,
      ),
    );
  }
}
