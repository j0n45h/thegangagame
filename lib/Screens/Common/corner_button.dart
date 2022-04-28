import 'dart:math';

import 'package:flutter/material.dart';

class CornerButton extends StatelessWidget {
  final Function onPressed;
  late Widget child;

   CornerButton({required this.onPressed, Widget? child, Key? key})
      : super(key: key){
        this.child=child??Text('');
      }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2.8,
      child: SizedBox(
        width: 38,
        height: 38,
        child: TextButton(
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