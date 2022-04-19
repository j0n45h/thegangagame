import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:thegangagame/Screens/Common/corner_button.dart';

class Rectangles extends StatelessWidget {
  final List<Function> activators;

  Rectangles({required this.activators, Key? key}) : super(key: key) {
    RangeError.range(activators.length, 3, 3);
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
            'assets/rechteck2.riv',
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
            right: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.width * 0.07,
            child: CornerButton(onPressed: activators[2]),
          ),
        ],
      ),
    );
  }
}