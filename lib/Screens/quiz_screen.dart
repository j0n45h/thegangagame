import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thegangagame/Screens/redirect_screen.dart';
import 'package:thegangagame/Util/checker.dart';
import 'package:rive/rive.dart';
import 'package:thegangagame/Util/redirector.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/";
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  final _answerTfController = TextEditingController();
  PageState _state = PageState.notGuessed;
  late AnimationController _loadingController;

  Artboard? _riveArtboard;
  RiveAnimationController? _riveAnimationController;

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


    rootBundle.load("assets/Circle1.riv").then((data) {
      final file = RiveFile.import(data);
      _riveArtboard = file.mainArtboard;

      _riveArtboard?.addController(_riveAnimationController = SimpleAnimation('Animation 1'));
      setState(() {});
    });

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300,
                width: 300,
                child: _riveArtboard == null
                    ? const SizedBox()
                    : Rive(artboard: _riveArtboard!),
              ),
            ),
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

    Navigator.of(context).pushNamed(RedirectScreen.routeName);
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
  noInviteLeft,
  loading,
  success
}
