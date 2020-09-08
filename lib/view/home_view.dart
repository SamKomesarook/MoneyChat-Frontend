import 'package:flutter/material.dart';
import 'message_data.dart';
import 'message_item.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView.builder(
            itemCount: messageData.length,
            itemBuilder:(BuildContext context, int index){
              return new MessageItem(messageData[index]);
            }
        )
    );
  }
}
