import 'package:flutter/material.dart';

import '../model/contact.dart';

class Chat extends StatefulWidget {
  Contact _contact;

  Chat(Contact contact) {
    _contact = contact;
  }

  @override
  _ChatState createState() => _ChatState(_contact);
}

class _ChatState extends State<Chat> {
  Contact _contact;

  _ChatState(Contact contact) {
    _contact = contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(_contact.imagePath),
            ),
            SizedBox(
              width: 10,
            ),
            Text(_contact.getName()),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Chatting with ' + _contact.getName()),
          ],
        ),
      ),
    );
  }
}
