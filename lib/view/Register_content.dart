import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../style/Style.dart' as theme;

class SignUpPage extends StatefulWidget {

  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FocusNode passwordFocusNode = new FocusNode();
  bool isShowPassWord = false;
  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 23),
        child: new Stack(
          alignment: Alignment.topCenter,
          overflow: Overflow.visible,
          children: <Widget>[
            new Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.white,),
                width: 300,
                height: 360,
                child: buildSignUpTextForm()
            ),
            new Positioned(child: buildSignUpButton(), top: 370,)
          ],
        )
    );
  }

  Widget buildSignUpTextForm() {
    return new Form(child: new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        //User name
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child: new TextFormField(
              decoration: new InputDecoration(
                  icon: new Icon(FontAwesomeIcons.user, color: Colors.black,),
                  hintText: "Name",
                  border: InputBorder.none
              ),
              style: new TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        new Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),
        //Phone Number
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child: new TextFormField(
              decoration: new InputDecoration(
                  icon: new Icon(Icons.phone, color: Colors.black,),
                  hintText: "Phone Number",
                  border: InputBorder.none
              ),
              style: new TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        new Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),
        //Password
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child: new TextFormField(
//              focusNode: passwordFocusNode,
              decoration: new InputDecoration(
                icon: new Icon(Icons.lock, color: Colors.black,),
                hintText: "Password",
                border: InputBorder.none,
                suffixIcon: new IconButton(
                    icon: new Icon(Icons.remove_red_eye, color: Colors.black,),
                    onPressed:showPassWord),
              ),
              obscureText: !isShowPassWord,
              style: new TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        new Container(
          height: 1,
          width: 250,
          color: Colors.grey[400],
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25, right: 25, top: 20, bottom: 20),
            child: new TextFormField(
              decoration: new InputDecoration(
                icon: new Icon(Icons.lock, color: Colors.black,),
                hintText: "Confirm Password",
                border: InputBorder.none,
                suffixIcon: new IconButton(
                    icon: new Icon(Icons.remove_red_eye, color: Colors.black,),
                    onPressed: showPassWord),
              ),
              obscureText: !isShowPassWord,
//              obscureText: true,
              style: new TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ],
    ));
  }
  Widget buildSignUpButton(){
    return
      new GestureDetector(
        child: new Container(
          padding: EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
          decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: theme.Style.primaryGradient,
          ),
          child: new Text(
            "Register", style: new TextStyle(fontSize: 25, color: Colors.white),),
        ),
        onTap: () {
          Navigator.pushReplacementNamed(context, "/home");
        },

      );
  }
  void showPassWord() {
    setState(() {
      isShowPassWord = !isShowPassWord;
    });
  }

}