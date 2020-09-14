import 'dart:collection';

import 'package:moneychat/model/conversation.dart';

import 'contact.dart';
import 'message.dart';
import 'wallet.dart';

class User {
  String _firstName;
  String _lastName;
  String _imgPath;
  Wallet _wallet;
  HashMap<int, Contact> _contacts;
  HashMap<int, Conversation> _conversations;

  User(String firstName, String lastName, String imgPath, Wallet wallet) {
    _firstName = firstName;
    _lastName = lastName;
    _imgPath = imgPath;
    _wallet = wallet;
    _contacts = new HashMap<int, Contact>();
    createContacts();
    _conversations = new HashMap<int, Conversation>();
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
    _contacts[7] = new Contact(7, 'Paul', 'Lee', '0123456789',
        'assets/images/profile_pictures/paul_lee.jpeg');
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
}
