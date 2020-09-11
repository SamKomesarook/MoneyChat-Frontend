import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:moneychat/model/user.dart';

import 'model/session.dart';
import 'model/user.dart';
import 'model/wallet.dart';
import 'widgets/navigation.dart';

void main() {
  Wallet wallet = new Wallet(150.0);
  User user = new User('John', 'Smith',
      'assets/images/profile_pictures/john_smith.jpeg', wallet);
  Session.shared.user = user;

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
            Image.asset(
              "assets/images/logo.png",
              scale: 5,
            ),
            Text(
              'moneyChat',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                letterSpacing: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: OutlineButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
                borderSide: BorderSide(
                  width: 2,
                ),
                padding: EdgeInsets.all(20),
                child: Text(
                  "LOG IN WITH GOOGLE",
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
