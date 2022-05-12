import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/Common/input_field.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/SecondQuiz/second_quiz.dart';
import 'package:thegangagame/Screens/ThirdQuiz/third_quiz_state_machine.dart';
import 'package:thegangagame/Util/UI/cheat_screen.dart';
import 'package:thegangagame/Util/quiz_tracker.dart';


class ThirdQuiz extends StatelessWidget {
  static const String routeName = "/videoscreen/messagescreen/firstquiz/secondquiz/thirdquiz";

  const ThirdQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<QuizTracker>().state.index < QuizState.Second.index) {
      return CheatScreen();
    }
    return Scaffold(
      body: Stack(
        children: [
          Background(assetPath:'assets/Quiz_3/FourthPost(QueerFormat)Kopie.svg'),
          const ThirdQuizStateMachine(),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: MediaQuery.of(context).size.height * 0.5 -
                MediaQuery.of(context).size.width * 0.2,
              child: const InputField(),
          ),
        ],
      ),
    );
  }
}
