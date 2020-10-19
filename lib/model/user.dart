import 'dart:collection';

import 'package:moneychat/model/conversation.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

import 'contact.dart';
import 'message.dart';
import 'messages_listener.dart';
import 'wallet.dart';

class User {
  xmpp.Connection _connection;
  xmpp.MessagesListener _listener;
  String _xmppAddress;
  String _username;
  String _imgPath;
  Wallet _wallet;
  HashMap<int, Contact> _contacts;
  HashMap<int, Conversation> _conversations;

  User(String username, String imgPath, Wallet wallet) {
    _xmppAddress = username + '@34.123.149.202';
    _username = username;
    _imgPath = imgPath + username + '.jpg';
    _wallet = wallet;
    _contacts = new HashMap<int, Contact>();
    createContacts();
    _conversations = new HashMap<int, Conversation>();
  }

  void connectToServer(String password) {
    var account = xmpp.XmppAccountSettings(
        _xmppAddress, _username, '34.123.149.202', password, 5222,
        host: '34.123.149.202', resource: 'xmppstone');
    _connection = xmpp.Connection(account);
    _connection.connect();

    _listener = new MessagesListener();
    ConnectionStateChangedListener(_connection, _listener);
  }

  int getContactIndex(String xmppAddress) {
    print('\n' + xmppAddress + '\n');

    for (int i = 0; i < contacts.length; i++) {
      print(contacts[i].xmppAddress);

      if (contacts[i].xmppAddress == xmppAddress) {
        return i;
      }
    }

    return -1;
  }

  void createContacts() {
    if (this.firstName == 'will') {
      _contacts[0] = new Contact(
          0,
          'david@34.123.149.202',
          'David',
          'Manolitsas',
          '0123456789',
          'assets/images/profile_pictures/david.jpg');

      print(_contacts[0].xmppAddress);
    } else {
      _contacts[0] = new Contact(0, 'will@34.123.149.202', 'William', 'Yu',
          '0123456789', 'assets/images/profile_pictures/will.jpg');

      print(_contacts[0].xmppAddress);
    }

    // Mock Contact List
//    _contacts[1] = new Contact(1, 'Rebecca', 'Ang', '0123456789',
//        'assets/images/profile_pictures/rebecca_ang.jpeg');
//    _contacts[2] = new Contact(2, 'Chris', 'Braden', '0123456789',
//        'assets/images/profile_pictures/chris_braden.jpeg');
//    _contacts[4] = new Contact(3, 'Steph', 'Foster', '0123456789',
//        'assets/images/profile_pictures/steph_foster.jpeg');
//    _contacts[5] = new Contact(4, 'Sarah', 'Fredricks', '0123456789',
//        'assets/images/profile_pictures/sarah_fredricks.jpeg');
//    _contacts[6] = new Contact(5, 'Jessica', 'Harris', '0123456789',
//        'assets/images/profile_pictures/jessica_harris.jpeg');
//    _contacts[7] = new Contact(6, 'Anna', 'Adams', '0123456789',
//        'assets/images/profile_pictures/anna_adams.jpeg');
//    _contacts[8] = new Contact(7, 'Vivian', 'Morrison', '0123456789',
//        'assets/images/profile_pictures/vivian_morrison.jpeg');
//    _contacts[9] = new Contact(8, 'Jordan', 'Rogers', '0123456789',
//        'assets/images/profile_pictures/jordan_rogers.jpeg');
//    _contacts[10] = new Contact(9, 'Brett', 'Stevens', '0123456789',
//        'assets/images/profile_pictures/brett_stevens.jpeg');
  }

  void newMessageSent(Message message, Contact contact) {
    // Previous Conversation
    if (_conversations.containsKey(contact.ID)) {
      _conversations[contact.ID].addMessage(message);
    }
    // First time Message
    else {
      Conversation conversation = new Conversation(contact);
      conversation.addMessage(message);
      _conversations[contact.ID] = conversation;
    }
  }

  String getName() {
    return _username;
  }

  String get firstName => _username;

  String get imgPath => _imgPath;

  set imgPath(String value) {
    _imgPath = value;
  }

  Wallet get wallet => _wallet;

  set wallet(Wallet value) {
    _wallet = value;
  }

  HashMap<int, Contact> get contacts => _contacts;

  HashMap<int, Conversation> get conversations => _conversations;

  String get xmppAddress => _xmppAddress;

  xmpp.MessagesListener get listener => _listener;

  xmpp.Connection get connection => _connection;
}
