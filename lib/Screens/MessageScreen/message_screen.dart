import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/MessageScreen/message.dart';


class MessageScreen extends StatelessWidget {
  static const String routeName = "/firstquiz/secondquiz/thirdquiz/messagescreen";

  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(assetPath: 'assets/Quiz_2/FirstPost(QueerFormat)Kopie.svg'),
          Message()
        ],
      ),
    );
  }
}