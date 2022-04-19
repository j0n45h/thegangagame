import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  late String _assetPath;
  Background({String? assetPath, Key? key}) : super(key: key) {
    _assetPath = assetPath ?? "assets/FirstPost(QueerFormat)Kopie.svg";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget> [
        Container(
          color: Colors.black,
        ),
        SvgPicture.asset(
          _assetPath,
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
