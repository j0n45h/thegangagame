import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/Common/background.dart';
import 'package:thegangagame/Screens/Common/input_field.dart';
import 'package:thegangagame/Screens/FirstQuiz/fisrt_quiz_state_machine.dart';

class FirstQuiz extends StatelessWidget {
  static const String routeName = "/";

  const FirstQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          const FirstQuizStateMachine(),
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
