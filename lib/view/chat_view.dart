import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:moneychat/model/message.dart';
import 'package:moneychat/model/session.dart';
import 'package:moneychat/model/transaction.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

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

  _ChatState(Contact contact) {
    _contact = contact;
  }

  final TextEditingController _textEditingController =
      new TextEditingController();

  void _sendMoney() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 400.0,
              child: Text(
                'How much would you like to pay ' + _contact.getName() + '?',
                textAlign: TextAlign.center,
                style: subheadingStyle,
              ),
            ),
            buildPaymentOption(5.0),
            buildPaymentOption(10.0),
            buildPaymentOption(20.0),
            buildPaymentOption(50.0),
            buildPaymentOption(100.0),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentOption(double price) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
          color: sentMessageBoxColor, borderRadius: BorderRadius.circular(8.0)),
      child: FlatButton(
        child: Text('\$' + price.toStringAsFixed(2),
            style: TextStyle(fontSize: 18.0, color: Colors.white)),
        color: sentMessageBoxColor,
        onPressed: () {
          Navigator.pop(context);
          _confirmPayment(price);
        },
      ),
    );
  }

  void _confirmPayment(double amount) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Send \$' +
                    amount.toStringAsFixed(2) +
                    ' to ' +
                    _contact.firstName +
                    '?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 24, 0, 6),
              child: Container(
                width: 250.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8.0)),
                child: FlatButton(
                  child: Text(
                    'Pay',
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (amount <= Session.shared.user.wallet.balance) {
                      // Payment Successful
                      Transaction transaction =
                          new Transaction(_contact, amount, false);
                      Session.shared.user.wallet.addTransaction(transaction);

                      // Add message to conversation history
                      Message message = new Message(
                          '\$' +
                              amount.toStringAsFixed(2) +
                              ' sent to ' +
                              _contact.firstName,
                          DateTime.now(),
                          MessageType.paymentSent);
                      Session.shared.user.newMessageSent(message, _contact);

                      Navigator.pop(context);

                      // Refresh message list
                      setState(() {
                        buildMessageList();
                      });
                    } else {
                      Navigator.pop(context);

                      // Payment failed
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Insufficient Funds'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Your payment was declined'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Close'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: fadedBodyStyle),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    //Frontend add message to
    Message message = new Message(_textEditingController.value.text,
        DateTime.now(), MessageType.sentMessage);

    // Get the contact Jid
    var receiver = _contact.xmppAddress;
    var receiverJid = xmpp.Jid.fromFullJid(receiver);
    // Send message
    xmpp.MessageHandler messageHandler =
        xmpp.MessageHandler.getInstance(Session.shared.user.connection);
    messageHandler.sendMessage(receiverJid, message.content);

    // Add to frontend list
    Session.shared.user.newMessageSent(message, _contact);

    // Clear the message input
    _textEditingController.clear();

    // Refresh message list
    setState(() {
      buildMessageList();
    });
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
    switch (message.messageType) {
      case MessageType.sentMessage:
        {
          // statements;
          return Container(
            child: Text(
              message.content,
              style: sentMessageContentStyle,
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(
                color: sentMessageBoxColor,
                borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.fromLTRB(200, 8, 8, 0),
          );
        }
        break;

      case MessageType.receivedMessage:
        {
          return Container(
              child: Text(
                message.content,
              ),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              width: 200.0,
              decoration: BoxDecoration(
                  color: receivedMessageColor,
                  borderRadius: BorderRadius.circular(8.0)),
              margin: EdgeInsets.fromLTRB(8, 8, 200, 0));
        }
        break;

      case MessageType.paymentSent:
        {
          return Container(
            child: Text(
              message.content,
              style: sentMessageContentStyle,
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.fromLTRB(200, 8, 8, 0),
          );
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  Widget buildMessageInput() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            FocusedMenuHolder(
                blurSize: 1,
                blurBackgroundColor: Colors.white,
                menuWidth: MediaQuery.of(context).size.width * 0.5,
                onPressed: () {},
                menuItems: <FocusedMenuItem>[
                  FocusedMenuItem(
                    title: Text('Camera'),
                    trailingIcon: Icon(Icons.photo_camera),
                    onPressed: () {
                      print('Opening camera...');
                    },
                  ),
                  FocusedMenuItem(
                    title: Text('Send Money'),
                    trailingIcon: Icon(Icons.attach_money),
                    onPressed: () {
                      _sendMoney();
                    },
                  ),
                  FocusedMenuItem(
                    title: Text('Send Attachment'),
                    trailingIcon: Icon(Icons.attach_file),
                    onPressed: () {
                      print('Sending attachment...');
                    },
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    color: accentColor,
                  ),
                )),
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
                    // send message
                    _sendMessage();
                    // refresh
                    setState(() {
                      buildMessageList();
                    });
                  }
                },
              ),
            ),
          ],
        ),
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

//FocusedMenuHolder(
//onPressed: () {},
//menuItems: <FocusedMenuItem>[
//FocusedMenuItem(title: Text('Camera'), onPressed: () {}),
//FocusedMenuItem(title: Text('Send Money'), onPressed: () {})
//],
//),

//PopupMenuButton<ChatPopupMenu>(
//elevation: 100.2,
//onSelected: (ChatPopupMenu result) {
//setState(() {
//_selection = result;
//});
//},
//itemBuilder: (BuildContext context) =>
//<PopupMenuEntry<ChatPopupMenu>>[
////                showMenu(context: null, position: null, items: null)
//PopupMenuItem<ChatPopupMenu>(
//value: ChatPopupMenu.camera,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: [Icon(Icons.camera_alt), Text('Camera')],
//),
//),
//PopupMenuItem<ChatPopupMenu>(
//value: ChatPopupMenu.sendMoney,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: [Icon(Icons.attach_money), Text('Send Money')],
//),
//),
//],
//),
