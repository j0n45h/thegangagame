import 'package:flutter/material.dart';
import 'package:thegangagame/Util/UI/link_button.dart';
import 'package:thegangagame/Util/redirector.dart';

class RedirectScreen extends StatefulWidget {
  static const routeName = "/redirect";
  const RedirectScreen({Key? key}) : super(key: key);

  @override
  State<RedirectScreen> createState() => _RedirectScreenState();
}

class _RedirectScreenState extends State<RedirectScreen>  with TickerProviderStateMixin {
  PageState _state = PageState.initial;
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_state == PageState.initial)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Congratulations your answer was correct!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 32)),
                  const SizedBox(height: 50),
                  const Text("Click the button to join our Discord channel.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                  const SizedBox(height: 50),
                  LinkButton(buttonType: ButtonType.own, text: "Join the Channel"),
                ],
              ),
            if (_state == PageState.loading)
              CircularProgressIndicator(
                value: _loadingController.value,
                color: Colors.blue,
                semanticsLabel: 'Loading...',
              ),
            if(_state == PageState.noInviteLeft)
              const Text(
                  "Sorry, you are too late. The Discord channel is full",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 42),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _continueToDiscord() async {
    setState(() => _state = PageState.loading);

    if (!await Redirector.tryLoadDiscord()){
      setState(() => _state = PageState.noInviteLeft);
      return;
    }

    setState(() => _state = PageState.initial);
  }

  @override
  void dispose(){
    _loadingController.dispose();
    super.dispose();
  }
}

enum PageState {
  initial,
  loading,
  noInviteLeft
}
