import 'package:flutter/material.dart';

// Text Style
const TextStyle bodyTextStyle = TextStyle(fontSize: 18);
const TextStyle subheadingStyle =
    TextStyle(color: Colors.blueGrey, fontSize: 22);
const TextStyle headingStyle =
    TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
const TextStyle sendingTextStyle = TextStyle(fontSize: 18, color: Colors.red);
const TextStyle receivingTextStyle =
    TextStyle(fontSize: 18, color: Colors.green);
const TextStyle buttonTextStyle =
    TextStyle(fontSize: 16, color: Colors.blueGrey);
const TextStyle sentMessageContentStyle = TextStyle(color: Colors.white);
const TextStyle fadedBodyStyle = TextStyle(color: Colors.grey);

//Colors
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.blueGrey;
const Color backgroundColor = Colors.white;
final Color accentColor = Colors.blueGrey.shade400;
final Color opaqueAccentColor = Colors.blueGrey.shade200;
final Color fadedBody = Colors.grey;

const Color receivedMessageColor = Color(0xffDCE4F4);
const Color sentMessageBoxColor = Color(0xff2E4981);

class Style {
  static const Color loginGradientStart = Colors.white;
  static const Color loginGradientEnd = Colors.blue;

  static const LinearGradient primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
