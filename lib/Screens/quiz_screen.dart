import 'package:flutter/material.dart';
import 'package:thegangagame/Util/checker.dart';
import 'package:thegangagame/Util/url_loader.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  final _answerTfController = TextEditingController();
  bool wrongAnswer = false;
  bool userIsNew = true;
  PageState _state = PageState.notGuessed;
  late AnimationController _loadingController;

  @override
  void initState() {
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      if (_state == PageState.loading) {
        setState(() {});
      }
    });
    _loadingController.repeat();
    super.initState();
  }

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
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red, fontSize: 32)),
                    SizedBox(height: 50),
                  ]),
            if (_state == PageState.notGuessed ||
                _state == PageState.wrongAnswer)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Enter your Answer!",
                      textAlign: TextAlign.center,
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
              const Text("You have been here before!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 42)),
            if (_state == PageState.noInvitesLeft)
              const Text(
                  "Sorry, you are too late. The Discord channel is full",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 42)),
            if (_state == PageState.success)
              const Text("Congratulations your answer was correct!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 42)),
            if (_state == PageState.loading)
              CircularProgressIndicator(
                value: _loadingController.value,
                color: Colors.blue,
                semanticsLabel: 'Loading...',
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _submit(String answer) async {
    setState(() => _state = PageState.loading);

    if (answer.length > 50) {
      setState(() => _state = PageState.wrongAnswer);
      return;
    }

    if (!await Checker.checkAnswer(answer.toLowerCase())) {
      setState(() => _state = PageState.wrongAnswer);
      return;
    }

    if (!await Checker.checkIfUserIsNewFp()) {
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
    _loadingController.dispose();
    super.dispose();
  }
}

enum PageState {
  notGuessed,
  wrongAnswer,
  userHasBeenHere,
  noInvitesLeft,
  loading,
  success
}
