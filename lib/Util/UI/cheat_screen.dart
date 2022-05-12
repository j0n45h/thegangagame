import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/MessageScreen/message_screen.dart';

class CheatScreen extends StatelessWidget {
  const CheatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("You are Cheating!"),
            const SizedBox(height: 100),
            MaterialButton(
              child: Text("Back"),
                onPressed: () => Navigator.pushNamed(context, MessageScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
