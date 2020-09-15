import 'package:moneychat/model/message.dart';

import 'contact.dart';

class Conversation {
  int _conversationID;
  Contact _contact;
  List<Message> _messages;

  Conversation(Contact contact) {
    _conversationID = contact.ID;
    _contact = contact;
    _messages = new List<Message>();
  }

  void addMessage(Message message) {
    _messages.add(message);
  }

  List<Message> get messages => _messages;

  Contact get contact => _contact;

  int get conversationID => _conversationID;
}
