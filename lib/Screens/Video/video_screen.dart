import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/MessageScreen/message.dart';
import 'package:thegangagame/Screens/Video/video.dart';


class VideoScreen extends StatelessWidget {
  static const String routeName = "/videoscreen";

  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(assetPath: 'assets/Quiz_2/FirstPost(QueerFormat)Kopie.svg'),
          VideoPlayer1()
        ],
      ),
    );
  }
}