import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/MessageScreen/message.dart';
import 'package:thegangagame/Screens/Mail/mail.dart';


class MailScreen extends StatelessWidget {
  static const String routeName = "/videoscreen/messagescreen/firstquiz/secondquiz/thirdquiz/mail";

  const MailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(assetPath: 'assets/Quiz_2/FirstPost(QueerFormat)Kopie.svg'),
          Mail()
        ],
      ),
    );
  }
}