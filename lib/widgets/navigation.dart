import 'package:flutter/material.dart';
import '../view/contacts_view.dart';
import '../view/wallet_view.dart';
import '../view/chat_view.dart';
import '../view/home_view.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  String _appBarTitle = "Money Chat";

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        _appBarTitle = 'Money Chat';
      } else if (index == 1) {
        _appBarTitle = 'Messages';
      } else if (index == 2) {
        _appBarTitle = 'Contacts';
      } else if (index == 3) {
        _appBarTitle = 'Money Chat Wallet';
      }
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    // A List of different widget views
    Home(),
    Chat(),
    Contacts(),
    Wallet(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_appBarTitle'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueGrey),
            title: Text('Home', style: TextStyle(color: Colors.blueGrey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat, color: Colors.blueGrey),
            title: Text('Chat', style: TextStyle(color: Colors.blueGrey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: Colors.blueGrey),
            title: Text('Contacts', style: TextStyle(color: Colors.blueGrey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: Colors.blueGrey),
            title: Text('Wallet', style: TextStyle(color: Colors.blueGrey)),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
