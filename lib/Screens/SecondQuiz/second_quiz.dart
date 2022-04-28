import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/SecondQuiz/second_quiz_state_machine.dart';

class SecondQuiz extends StatelessWidget {
  static const String routeName = "/firstquiz/secondquiz";

  const SecondQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(assetPath: 'assets/Quiz_2/SecondtPost(QueerFormat)Kopie.svg'),
          SecondQuizStateMachine(),
        ],
      ),
    );
  }
}
