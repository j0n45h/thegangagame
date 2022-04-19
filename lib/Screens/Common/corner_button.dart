import 'dart:math';

import 'package:flutter/material.dart';

class CornerButton extends StatelessWidget {
  final Function onPressed;
  final Widget? child;

  const CornerButton({required this.onPressed, this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2.8,
      child: SizedBox(
        width: 38,
        height: 38,
        child: ElevatedButton(
          onPressed: () => onPressed(),
          child: child,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}