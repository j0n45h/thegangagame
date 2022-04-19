import 'package:flutter/material.dart';
import 'package:thegangagame/Util/link_generator.dart';

class LinkButton extends StatefulWidget {
  final ButtonType buttonType;
  final String text;
  final Color color;
  const LinkButton({
    required this.buttonType,
    required this.text,
    Key? key,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> with TickerProviderStateMixin {
  PageState _state = PageState.initial;
  String _linkUrl = "";
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
    return Column(
      children: [
        MaterialButton(
          onPressed: _onPressed,
          color: widget.color,
          child: Row(
            children: [
              Text(
                widget.text,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
              if (_state == PageState.loading)
                CircularProgressIndicator(
                  value: _loadingController.value,
                  color: Colors.blue,
                  semanticsLabel: 'Loading...',
                ),
            ],
          ),
        ),
        const SizedBox(height: 60),
        if (_state == PageState.pressed)
          Text(
            _linkUrl,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
      ],
    );
  }

  Future<void> _onPressed() async {
    setState(() => _state = PageState.loading);
    if (widget.buttonType == ButtonType.own){
      _linkUrl = await LinkGenerator.getLink();
      setState(() => _state == PageState.pressed);
    }
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }
}

enum ButtonType {
  own,
  friend
}

enum PageState {
  initial,
  loading,
  pressed
}