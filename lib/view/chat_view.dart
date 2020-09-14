import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:moneychat/model/message.dart';

import '../model/contact.dart';
import '../model/session.dart';
import '../style/style.dart';

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
  ScrollController _messageListController = new ScrollController();

  final TextEditingController _textEditingController =
      new TextEditingController();

  _ChatState(Contact contact) {
    _contact = contact;

    if (Session.shared.user.conversations.containsKey(contact.ID)) {
      Session.shared.user.conversations[contact.ID].messages.forEach((element) {
        print(element.content + ' sent at ' + element.getTime());
      });
    }
  }

  void _sendMessage() {
    //TODO: send message xmpp POST
    print('\"' +
        _textEditingController.value.text +
        '\" sent to ' +
        _contact.getName());
    Message message =
        new Message(_textEditingController.value.text, DateTime.now());
    Session.shared.user.newMessageSent(message, _contact);
    _textEditingController.clear();
  }

  Widget buildMessageList() {
    if (Session.shared.user.conversations.containsKey(_contact.ID)) {
      return ListView.builder(
          controller: _messageListController,
          itemCount:
              Session.shared.user.conversations[_contact.ID].messages.length,
          itemBuilder: (context, index) {
            return buildMessageItem(
                Session.shared.user.conversations[_contact.ID].messages[index]);
          });
    }

    return Center(child: Text('No Message History', style: fadedBodyStyle));
  }

  Widget buildMessageItem(Message message) {
    return Container(
      child: Text(
        message.content,
        style: messageContentStyle,
      ),
      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
      width: 200.0,
      decoration: BoxDecoration(
          color: sentMessageBoxColor, borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.fromLTRB(200, 8, 8, 0),
    );
  }

  Widget buildMessageInput() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: accentColor),
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                autocorrect: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    border: InputBorder.none,
                    hintText: 'Money Chat',
                    hintStyle: TextStyle(color: opaqueAccentColor)),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            width: 45.0,
            height: 45.0,
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              child: Icon(Icons.send),
              onPressed: () {
                if (_textEditingController.value.text.isNotEmpty) {
                  setState(() {
                    buildMessageList();
                  });
                  _sendMessage();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    if (Session.shared.user.conversations.containsKey(_contact.ID)) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _messageListController
            .jumpTo(_messageListController.position.maxScrollExtent);
      });
    }

    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 72.0),
              child: buildMessageList(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: buildMessageInput(),
            ),
          ],
        ),
      ),
    );
  }
}
