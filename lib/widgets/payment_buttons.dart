import 'package:flutter/material.dart';
import 'package:moneychat/style/colors.dart';

class PaymentButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  PaymentButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) => Container(
      height: 64,
      width: MediaQuery.of(context).size.width * .3,
      child: RaisedButton(
          child: FittedBox(
              child: Text(text,
                  style: TextStyle(color: Colors.black, fontSize: 18))),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          onPressed: onPressed));
}
