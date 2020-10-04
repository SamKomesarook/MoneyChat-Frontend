import 'package:intl/intl.dart';

enum MessageType {
  sentMessage,
  receivedMessage,
  paymentSent,
}

class Message {
  String _content;
  DateTime _timeSent;
  MessageType _messageType;

  Message(String content, DateTime timeSent, MessageType messageType) {
    _content = content;
    _timeSent = timeSent;
    _messageType = messageType;
  }

  String getTime() {
    return new DateFormat.jm().format(_timeSent);
  }

  DateTime get timeSent => _timeSent;

  String get content => _content;

  MessageType get messageType => _messageType;
}
