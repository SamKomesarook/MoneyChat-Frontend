import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'navigation.dart';

void main() {
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
              "assets/logo.png",
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
            OutlineButton(
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
          ],
        ),
      ),
    );
  }
}
