import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:thegangagame/Screens/ThirdQuiz/rectangles.dart';

class ThirdQuizStateMachine extends StatefulWidget {
  const ThirdQuizStateMachine({Key? key}) : super(key: key);

  @override
  State<ThirdQuizStateMachine> createState() => _ThirdQuizStateMachineState();
}

class _ThirdQuizStateMachineState extends State<ThirdQuizStateMachine> {
  SMITrigger? _bump1;
  SMITrigger? _bump2;
  SMITrigger? _bump3;
  SMITrigger? _bump4;

  void _hitBump1() => _bump1?.fire();

  void _hitBump2() => _bump2?.fire();

  void _hitBump3() => _bump3?.fire();

  void _hitBump4() => _bump4?.fire();

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _bump1 = controller.findInput<bool>('T0') as SMITrigger;
    _bump2 = controller.findInput<bool>('T1') as SMITrigger;
    _bump3 = controller.findInput<bool>('T2') as SMITrigger;
    _bump4 = controller.findInput<bool>('T3') as SMITrigger;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RiveAnimation.asset(
            'assets/Quiz_3/gameNew.riv',
            fit: BoxFit.fill,
            onInit: _onRiveInit,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 60),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Rectangles(
              activators: [_hitBump1, _hitBump2, _hitBump3, _hitBump4],
            ),
          ),
        ],
      ),
    );
  }
}
