import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/session.dart';
import '../model/user.dart';
import '../model/wallet.dart';
import '../style/style.dart' as theme;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FocusNode phoneNumFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusScopeNode focusScopeNode = new FocusScopeNode();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> _signInFormKey = new GlobalKey();

  bool isShowPassWord = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.only(top: 23),
      child: new Stack(
        alignment: Alignment.center,

//        overflow: Overflow.visible,
        children: <Widget>[
          new Column(
            children: <Widget>[
              buildSignInTextForm(),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: new Text(
                  "Forgot Password?",
                  style: new TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: new Row(
//                          mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(colors: [
                        Colors.white10,
                        Colors.white,
                      ])),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: new Text(
                        "Or",
                        style: new TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    new Container(
                      height: 1,
                      width: 100,
                      decoration: BoxDecoration(
                          gradient: new LinearGradient(colors: [
                        Colors.white,
                        Colors.white10,
                      ])),
                    ),
                  ],
                ),
              ),
              new SizedBox(
                height: 10,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Color(0xFF0084ff),
                        ),
                        onPressed: null),
                  ),
                  new SizedBox(
                    width: 40,
                  ),
                  new Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new IconButton(
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Color(0xFF0084ff),
                        ),
                        onPressed: null),
                  ),
                ],
              )
            ],
          ),
          new Positioned(
            child: buildSignInButton(),
            top: 200,
          )
        ],
      ),
    );
  }

  // Control whether shows the password.
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

  Widget buildSignInTextForm() {
    return new Container(
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      width: 300,
      height: 190,
      child: new Form(
        key: _signInFormKey,

//        autovalidate: true,
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: new TextFormField(
                  controller: _usernameController,
                  focusNode: phoneNumFocusNode,
                  onEditingComplete: () {
                    if (focusScopeNode == null) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(passwordFocusNode);
                  },
                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      hintText: "Username",
                      border: InputBorder.none),
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Username can not be empty!";
                    }
                  },
                  onSaved: (value) {},
                ),
              ),
            ),
            new Container(
              height: 1,
              width: 250,
              color: Colors.grey[400],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: new TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  decoration: new InputDecoration(
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Password",
                      border: InputBorder.none,
                      suffixIcon: new IconButton(
                          icon: new Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          onPressed: showPassWord)),
                  obscureText: !isShowPassWord,
                  style: new TextStyle(fontSize: 16, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 4) {
                      return "Password'length must longer than 4!";
                    }
                  },
                  onSaved: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSignInButton() {
    return new GestureDetector(
      child: new Container(
        padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: theme.Style.primaryGradient,
        ),
        child: new Text(
          "LOGIN",
          style: new TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: () {
        if (_signInFormKey.currentState.validate()) {
          _signInFormKey.currentState.save();

          String username = _usernameController.value.text;
          String password = _passwordController.value.text;

          //TODO: wallet is for testing (mock data)
          // Build mock user and data
          Wallet wallet = new Wallet(150.0);

          // Create user
          User user =
              new User(username, 'assets/images/profile_pictures/', wallet);
          Session.shared.user = user;
          Session.shared.user.connectToServer(password);

          Navigator.pushReplacementNamed(context, "/home");
        }
//          debugDumpApp();
      },
    );
  }
}
