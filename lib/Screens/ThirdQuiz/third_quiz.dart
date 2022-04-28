import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/Common/input_field.dart';
import 'package:thegangagame/Screens/ThirdQuiz/third_quiz_state_machine.dart';

class ThirdQuiz extends StatelessWidget {
  static const String routeName = "/firstquiz/secondquiz/thirdquiz";

  const ThirdQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(assetPath:'assets/Quiz_3/ThirdPost(QueerFormat)Kopie.svg'),
          const ThirdQuizStateMachine(),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            top: MediaQuery.of(context).size.height * 0.5 -
                MediaQuery.of(context).size.width * 0.2,
              child: const InputField(),
          ),
        ],
      ),
    );
  }
}
