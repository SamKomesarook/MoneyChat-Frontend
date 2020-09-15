import 'package:flutter/material.dart';

class AddToBalance extends StatefulWidget {
  @override
  _AddToBalanceState createState() => _AddToBalanceState();
}

class _AddToBalanceState extends State<AddToBalance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Balance'),
      ),
      body: Center(
        child: Text('Add to Balance'),
      ),
    );
  }
}
