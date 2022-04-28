import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:thegangagame/Screens/FirstQuiz/rectangles.dart';

class FirstQuizStateMachine extends StatefulWidget {
  const FirstQuizStateMachine({Key? key}) : super(key: key);

  @override
  State<FirstQuizStateMachine> createState() => _FirstQuizStateMachineState();
}

class _FirstQuizStateMachineState extends State<FirstQuizStateMachine> {
  SMITrigger? _bump1;
  SMITrigger? _bump2;
  SMITrigger? _bump3;

  void _hitBump1() => _bump1?.fire();

  void _hitBump2() => _bump2?.fire();

  void _hitBump3() => _bump3?.fire();

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _bump1 = controller.findInput<bool>('T1') as SMITrigger;
    _bump2 = controller.findInput<bool>('T2') as SMITrigger;
    _bump3 = controller.findInput<bool>('T3') as SMITrigger;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RiveAnimation.asset(
            'assets/game (1).riv',
            fit: BoxFit.fill,
            onInit: _onRiveInit,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 60),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Rectangles(
              activators: [_hitBump1, _hitBump2, _hitBump3],
            ),
          ),
        ],
      ),
    );
  }
}
