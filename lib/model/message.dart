import 'package:intl/intl.dart';

class Message {
  String _content;
  DateTime _timeSent;

  Message(String content, DateTime timeSent) {
    _content = content;
    _timeSent = timeSent;
  }

  String getTime() {
    return new DateFormat.jm().format(_timeSent);
  }

  DateTime get timeSent => _timeSent;

  String get content => _content;
}
