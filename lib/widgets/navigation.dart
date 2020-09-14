import 'package:flutter/material.dart';

import '../style/style.dart';
import '../view/contacts_view.dart';
import '../view/home_view.dart';
import '../view/wallet_view.dart';

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
        _appBarTitle = 'Contacts';
      } else if (index == 2) {
        _appBarTitle = 'Money Chat Wallet';
      }
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    // A List of different widget views
    Home(),
    Contacts(),
    WalletView(),
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
            icon: Icon(Icons.home, color: secondaryColor),
            title: Text('Home', style: TextStyle(color: secondaryColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: secondaryColor),
            title: Text('Contacts', style: TextStyle(color: secondaryColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet, color: secondaryColor),
            title: Text('Wallet', style: TextStyle(color: secondaryColor)),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
