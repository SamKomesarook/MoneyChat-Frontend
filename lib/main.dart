import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Login(),
  ));
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Open Money Chat'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
      ),
    );
  }
}
