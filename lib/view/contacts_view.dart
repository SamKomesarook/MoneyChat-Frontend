import 'package:flutter/material.dart';
import 'add_contact_view.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    final title = '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
          body: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.orange,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                ),
                title: Text(
                  'John Doe',
                ),
                subtitle: Text('0123456789'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Text('Another data');
                },
              ),
              new Divider(
                height: 1.0,
                indent: 1.0,
              ),
            ],
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
