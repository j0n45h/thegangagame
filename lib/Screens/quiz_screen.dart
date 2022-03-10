import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thegangagame/Util/checker.dart';
import 'package:thegangagame/Util/url_loader.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final _answerTfController = TextEditingController();
  bool wrongAnswer = false;
  bool userIsNew = true;
  PageState _state = PageState.notGuessed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_state == PageState.wrongAnswer)
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("The Answer was Wrong! Please try again.",
                        style: TextStyle(color: Colors.red, fontSize: 32)),
                    SizedBox(height: 50),
                  ]),
            if (_state == PageState.notGuessed ||
                _state == PageState.wrongAnswer)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Enter your Answer!",
                      style: TextStyle(color: Colors.black, fontSize: 32)),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: TextField(
                      onSubmitted: _submit,
                      autofocus: true,
                      controller: _answerTfController,
                    ),
                  ),
                ],
              ),
            if (_state == PageState.userHasBeenHere)
              const Center(
                child: Text("You have been here before!",
                    style: TextStyle(color: Colors.red, fontSize: 42)),
              ),
            if (_state == PageState.noInvitesLeft)
              const Center(
                child: Text(
                    "Sorry, you are too late. The Discord channel is full",
                    style: TextStyle(color: Colors.red, fontSize: 42)),
              ),
            if (_state == PageState.success)
              const Center(
                child: Text("Congratulations your answer was correct!",
                    style: TextStyle(color: Colors.red, fontSize: 42)),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(String answer) async {
    if (answer.length > 50) {
      setState(() => _state = PageState.wrongAnswer);
      return;
    }

    if (!await Checker.checkAnswer(answer.toLowerCase())) {
      setState(() => _state = PageState.wrongAnswer);
      return;
    }

    if (!await Checker.checkIfUserIsNew()) {
      setState(() => _state = PageState.userHasBeenHere);
      return;
    }
    if (!await UrlLoader.tryLoadDiscord()) {
      setState(() => _state = PageState.noInvitesLeft);
      return;
    }

    setState(() => _state = PageState.success);
  }

  @override
  void dispose() {
    _answerTfController.dispose();
    super.dispose();
  }
}

enum PageState {
  notGuessed,
  wrongAnswer,
  userHasBeenHere,
  noInvitesLeft,
  success
}
