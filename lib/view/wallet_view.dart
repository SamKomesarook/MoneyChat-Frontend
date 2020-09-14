import 'package:flutter/material.dart';

import'paypal_login.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text("Login your PayPal Account"),
                onPressed: () {
                  print('PayPal');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainWidget()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
