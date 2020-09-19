import 'package:flutter/material.dart';

class PayPalMainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PayPalMainWidgetState();
  }
}

class PayPalMainWidgetState extends State<PayPalMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("PayPal Login",),
      ),
      body: ContentWidget(),
    );
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LoginWidget(),
    );
  }
}

class LoginWidget extends StatelessWidget {
  String username;
  String password;
  GlobalKey<FormState> formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Form(
      key: formGlobalKey,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Container(
            child: Image.asset("assets/images/paypal_logo.png"),
          ),
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.people),
                labelText: 'Username'
            ),
            onSaved: (value){
              print ("username has been saved");
              this.username = value;
            },
            validator: (value){
              if (value == null || value.length == 0){
                return "username is empty!";
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Password",
            ),
            onSaved: (value){
              print ("password has been saved");
              this.password = value;
            },
            validator:(value){
              if(value == null || value.length == 0){
                return "password is empty!";
              }
              return null;
            },
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            height: 40,
            width: double.infinity,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: () {
                print("Login button has been clicked!");
                formGlobalKey.currentState.save();
                formGlobalKey.currentState.validate();
                print("username: $username password: $password");
              },
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forget Password?")
              ],
            ),
          ),
        ],
      ),
    );
  }
}