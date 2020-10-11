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
  String _firstName;
  String _lastName;
  String _imgPath;
  Wallet _wallet;
  HashMap<int, Contact> _contacts;
  HashMap<int, Conversation> _conversations;

  User(String xmppAddress, String firstName, String lastName, String imgPath,
      Wallet wallet) {
    _xmppAddress = xmppAddress;
    _firstName = firstName;
    _lastName = lastName;
    _imgPath = imgPath;
    _wallet = wallet;
    _contacts = new HashMap<int, Contact>();
    createContacts();
    _conversations = new HashMap<int, Conversation>();
    connectToServer('david', '34.123.149.202', '1234');
  }

  void connectToServer(String accountName, String host, String password) {
    var account = xmpp.XmppAccountSettings(
        _xmppAddress, accountName, host, password, 5222,
        host: host, resource: 'xmppstone');
    _connection = xmpp.Connection(account);
    _connection.connect();

    _listener = new MessagesListener();
    ConnectionStateChangedListener(_connection, _listener);
  }

  void createContacts() {
    // connect database
    // get contacts

    // Mock Contact List
    _contacts[1] = new Contact(1, 'Anna', 'Adams', '0123456789',
        'assets/images/profile_pictures/anna_adams.jpeg');
    _contacts[2] = new Contact(2, 'Rebecca', 'Ang', '0123456789',
        'assets/images/profile_pictures/rebecca_ang.jpeg');
    _contacts[3] = new Contact(3, 'Chris', 'Braden', '0123456789',
        'assets/images/profile_pictures/chris_braden.jpeg');
    _contacts[4] = new Contact(4, 'Steph', 'Foster', '0123456789',
        'assets/images/profile_pictures/steph_foster.jpeg');
    _contacts[5] = new Contact(5, 'Sarah', 'Fredricks', '0123456789',
        'assets/images/profile_pictures/sarah_fredricks.jpeg');
    _contacts[6] = new Contact(6, 'Jessica', 'Harris', '0123456789',
        'assets/images/profile_pictures/jessica_harris.jpeg');

    _contacts[7] = new Contact(7, 'William', 'Yu', '0123456789',
        'assets/images/profile_pictures/paul_lee.jpeg');
    _contacts[7].xmppAddress = 'will@34.123.149.202';

    _contacts[8] = new Contact(8, 'Vivian', 'Morrison', '0123456789',
        'assets/images/profile_pictures/vivian_morrison.jpeg');
    _contacts[9] = new Contact(9, 'Jordan', 'Rogers', '0123456789',
        'assets/images/profile_pictures/jordan_rogers.jpeg');
    _contacts[10] = new Contact(10, 'Brett', 'Stevens', '0123456789',
        'assets/images/profile_pictures/brett_stevens.jpeg');
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
    return _firstName + ' ' + lastName;
  }

  String get firstName => _firstName;

  String get imgPath => _imgPath;

  set imgPath(String value) {
    _imgPath = value;
  }

  Wallet get wallet => _wallet;

  set wallet(Wallet value) {
    _wallet = value;
  }

  HashMap<int, Contact> get contacts => _contacts;

  String get lastName => _lastName;

  HashMap<int, Conversation> get conversations => _conversations;

  String get xmppAddress => _xmppAddress;

  xmpp.MessagesListener get listener => _listener;

  xmpp.Connection get connection => _connection;
}
