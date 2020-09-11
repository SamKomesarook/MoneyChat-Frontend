import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double balance = 150.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  '\$' + balance.toStringAsFixed(2),
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
                  print('add to balance pressed');
                },
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 350.0,
              child: Divider(
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
