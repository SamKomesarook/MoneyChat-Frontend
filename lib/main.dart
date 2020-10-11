import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:moneychat/model/user.dart';
import 'package:moneychat/view/Login_content.dart';

import 'model/session.dart';
import 'model/transaction.dart';
import 'model/user.dart';
import 'model/wallet.dart';
import 'style/style.dart' as theme;
import 'view/Register_content.dart';
import 'widgets/navigation.dart';

void main() {
  runApp(MaterialApp(
    title: 'Money Chat',
    home: MainLoginPage(),
    routes: {
      "/home": (_) => new Navigation(),
    },
  ));
}

class MainLoginPage extends StatefulWidget {
  MainLoginPage({Key key}) : super(key: key);

  @override
  _MainLoginPageState createState() => new _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage>
    with TickerProviderStateMixin {
  PageController _pageController;
  PageView _pageView;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _pageView = new PageView(
      controller: _pageController,
      children: <Widget>[
        new SignInPage(),
        new SignUpPage(),
//        add the register Page here.
      ],
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*
      * additional option of SingleChildScrollView,
      * Just prevent OverFlow when the KeyBoard appeared.
      * */
      body: new SingleChildScrollView(
          child: new Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                gradient: theme.Style.primaryGradient,
              ),
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new SizedBox(
                    height: 75,
                  ),
                  Text(
                    ' Welcome to',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'Money Chat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 1.0,
                    ),
                  ),
//                  new Image(
//                      width: 250,
//                      height: 191,
//                      image: new AssetImage("assets/images/logo.png")),
                  new SizedBox(
                    height: 20,
                  ),

                  //indicator
                  new Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: Colors.grey,
                    ),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                            child: new Container(
                          decoration: _currentPage == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: Colors.white,
                                )
                              : null,
                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(0,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: new Text(
                                "Existing",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: new Container(
                          decoration: _currentPage == 1
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                  color: Colors.white,
                                )
                              : null,
                          child: new Center(
                            child: new FlatButton(
                              onPressed: () {
                                _pageController.animateToPage(1,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.decelerate);
                              },
                              child: new Text(
                                "Register",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
//                      new SignInPage(),
//                      new SignUpPage(),
                  new Expanded(child: _pageView),
                ],
              ))),
    );
  }
}
