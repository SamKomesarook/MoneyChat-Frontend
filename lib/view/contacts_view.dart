import 'package:flutter/material.dart';
import 'package:moneychat/view/chat_view.dart';

import '../model/contact.dart';
import '../model/session.dart';
import 'add_contact_view.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<Widget> buildContacts() {
    List<Widget> contacts = [];

    Session.shared.user.contacts.forEach((element) {
      contacts.add(buildContact(element));
      contacts.add(buildDivider());
    });

    return contacts;
  }

  Widget buildContact(Contact contact) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(contact.imagePath),
      ),
      title: Text(
        contact.getName(),
      ),
      subtitle: Text(contact.phoneNumber),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Chat(contact)),
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

  @override
  Widget build(BuildContext context) {
    final title = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
          body: ListView(
            children: buildContacts(),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddContact()),
              );
            },
            child: Icon(Icons.add),
          )),
    );
  }
}
