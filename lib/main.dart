import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:moneychat/model/user.dart';
import 'package:moneychat/view/Money_Chat_Login_Page.dart';
//import 'package:moneychat/view/paypal_login.dart';

import 'model/session.dart';
import 'model/transaction.dart';
import 'model/user.dart';
import 'model/wallet.dart';
import 'widgets/navigation.dart';

void main() {
  // Build mock user and data
  Wallet wallet = new Wallet(150.0);
  User user = new User('John', 'Smith',
      'assets/images/profile_pictures/john_smith.jpeg', wallet);
  Session.shared.user = user;
  Session.shared.user.wallet.lastTransaction =
      new Transaction(user.contacts[5], 25.00, false);

  runApp(MaterialApp(
    title: 'Money Chat',
    home: LoginPage(),
    routes: {
      "/home": (_) => new Navigation(),
    },
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' Welcome to',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Text(
              'Money Chat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                letterSpacing: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text("LOG IN"),
                color: Colors.blueGrey[50],
                onPressed: () {
//                  Navigator.pushReplacementNamed(context, "/home");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MainLoginPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
