import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:thegangagame/Screens/Common/corner_button.dart';

class Rectangles extends StatelessWidget {
  final List<Function> activators;

  Rectangles({required this.activators, Key? key}) : super(key: key) {
    RangeError.range(activators.length, 4, 4);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const RiveAnimation.asset(
            'assets/Quiz_3/rechteck2.riv',
            fit: BoxFit.scaleDown,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.21,
            top: MediaQuery.of(context).size.width * 0.06,
            child: CornerButton(onPressed: activators[0]),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.28,
            bottom: MediaQuery.of(context).size.width * 0.01,
            child: CornerButton(onPressed: activators[1]),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.037,
            bottom: MediaQuery.of(context).size.width * 0.07,
            child: CornerButton(onPressed: activators[2]),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.105,
            top: MediaQuery.of(context).size.width * 0.001,
            child: CornerButton(onPressed: activators[3]),
          ),
        ],
      ),
    );
  }
}