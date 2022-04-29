import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SecondQuizStateMachine extends StatefulWidget {
  const SecondQuizStateMachine({Key? key}) : super(key: key);

  @override
  State<SecondQuizStateMachine> createState() => _SecondQuizStateMachineState();
}

class _SecondQuizStateMachineState extends State<SecondQuizStateMachine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.16,
                    height: MediaQuery.of(context).size.width*0.16,
                    child: RiveAnimation.asset('assets/Quiz_2/circle1.riv')),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.16,
                    height: MediaQuery.of(context).size.width*0.16,
                    child: RiveAnimation.asset('assets/Quiz_2/circle2.riv')),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.16,
                    height: MediaQuery.of(context).size.width*0.16,
                    child: RiveAnimation.asset('assets/Quiz_2/circle3-1.riv')),
                SizedBox(
                    width: MediaQuery.of(context).size.width*0.16,
                    height: MediaQuery.of(context).size.width*0.16,
                    child: RiveAnimation.asset('assets/Quiz_2/circle4-1.riv')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
