import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/SecondQuiz/second_quiz_state_machine.dart';
import 'package:thegangagame/Screens/Common/input_field2.dart';
import 'package:thegangagame/Util/UI/cheat_screen.dart';
import 'package:thegangagame/Util/quiz_tracker.dart';


class SecondQuiz extends StatelessWidget {
  static const String routeName = "/videoscreen/messagescreen/firstquiz/secondquiz";

  const SecondQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<QuizTracker>().state.index < QuizState.First.index) {
        return CheatScreen();
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Background(assetPath: 'assets/Quiz_2/BGNew.svg'),
          SecondQuizStateMachine(),
          InputField2()
        ],
      ),
    );
  }
}
