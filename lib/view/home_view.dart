import 'package:flutter/material.dart';
import 'package:moneychat/style/style.dart';

import '../model/conversation.dart';
import '../model/session.dart';
import 'chat_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Build a list of past conversations
  List<Widget> buildConversations() {
    List<Widget> conversations = [];

    if (Session.shared.user.conversations.length == 0) {
      conversations.add(buildSuchEmpty());
      return conversations;
    }

    Session.shared.user.conversations.forEach((key, value) {
      conversations.add(buildConversation(value));
      conversations.add(buildDivider());
    });

    return conversations;
  }

  Widget buildConversation(Conversation conversation) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(conversation.contact.imagePath),
      ),
      title: Text(conversation.contact.getName()),
      subtitle: Text(
        conversation.messages.last.content,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        conversation.messages.last.getTime(),
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chat(conversation.contact)),
        );
      },
    );
  }

  Widget buildDivider() {
    return new Divider(
      height: 1.0,
      indent: 1.0,
    );
  }

  Widget buildSuchEmpty() {
    return new ListTile(
      title: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(
              Icons.free_breakfast,
              size: 50,
              color: fadedBody,
            ),
            Text(
              'Wow, such empty',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: fadedBody,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: buildConversations(),
      ),
    );
  }
}
