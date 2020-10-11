import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:console/console.dart';
import 'package:image/image.dart' as image;
import 'package:moneychat/model/message.dart';
import 'package:moneychat/model/session.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

class ConnectionStateChangedListener
    implements xmpp.ConnectionStateChangedListener {
  xmpp.Connection _connection;
  xmpp.MessagesListener _messagesListener;

  StreamSubscription<String> subscription;

  ConnectionStateChangedListener(
      xmpp.Connection connection, xmpp.MessagesListener messagesListener) {
    _connection = connection;
    _messagesListener = messagesListener;
    _connection.connectionStateStream.listen(onConnectionStateChanged);
  }

  @override
  void onConnectionStateChanged(xmpp.XmppConnectionState state) {
    if (state == xmpp.XmppConnectionState.Ready) {
      print('Connected');
//      timer = Timer.periodic(
//          Duration(milliseconds: 20000), (Timer t) {
//        _connection.close();
//        timer.cancel();
//      });

      var vCardManager = xmpp.VCardManager(_connection);
      vCardManager.getSelfVCard().then((vCard) {
        if (vCard != null) {
          print('Your info' + vCard.buildXmlString());
        }
      });
      xmpp.MessageHandler messageHandler =
          xmpp.MessageHandler.getInstance(_connection);
      var rosterManager = xmpp.RosterManager.getInstance(_connection);
      messageHandler.messagesStream.listen(_messagesListener.onNewMessage);
      sleep(const Duration(seconds: 1));
      //print('Enter receiver jid: ');
      //var receiver = stdin.readLineSync(encoding: utf8);
      var receiver = 'will@34.123.149.202';
      var receiverJid = xmpp.Jid.fromFullJid(receiver);
      rosterManager.addRosterItem(xmpp.Buddy(receiverJid)).then((result) {
        if (result.description != null) {
          print('add roster' + result.description);
        }
      });
      sleep(const Duration(seconds: 1));
      vCardManager.getVCardFor(receiverJid).then((vCard) {
        if (vCard != null) {
          print('Receiver info' + vCard.buildXmlString());
          if (vCard != null && vCard.image != null) {
            var file = File('test456789.jpg')
              ..writeAsBytesSync(image.encodeJpg(vCard.image));
            print('IMAGE SAVED TO: ${file.path}');
          }
        }
      });
      xmpp.PresenceManager presenceManager =
          xmpp.PresenceManager.getInstance(_connection);
      presenceManager.presenceStream.listen(onPresence);
    }
    if (state == xmpp.XmppConnectionState.Closed) {
      timer = Timer.periodic(Duration(milliseconds: 2000), (Timer t) {
        _connection.connect();
        timer.cancel();
      });
    }
  }

  void onPresence(xmpp.PresenceData event) {
    print('presence Event from ' +
        event.jid.fullJid +
        ' PRESENCE: ' +
        event.showElement.toString());
  }
}

Timer timer;

Stream<String> getConsoleStream() {
  return Console.adapter.byteStream().map((bytes) {
    var str = ascii.decode(bytes);
    str = str.substring(0, str.length - 1);
    return str;
  });
}

class MessagesListener implements xmpp.MessagesListener {
  @override
  void onNewMessage(xmpp.MessageStanza message) {
    if (message.body != null) {
      //TODO: testing hardcoded contact
      Message frontendMessage = new Message(
          message.body, DateTime.now(), MessageType.receivedMessage);
      Session.shared.user
          .newMessageSent(frontendMessage, Session.shared.user.contacts[7]);

      print(format(
          'New Message from {color.blue}${message.fromJid.userAtDomain}{color.end} message: {color.red}${message.body}{color.end}'));
    }
  }
}
