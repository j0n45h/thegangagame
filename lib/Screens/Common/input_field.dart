import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:thegangagame/Screens/Mail/mail_screen.dart';
import 'package:thegangagame/Util/quiz_tracker.dart';
import 'package:thegangagame/Util/upper_case_text_formatter.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  _InputFielder createState() => _InputFielder();
}

class _InputFielder extends State<InputField> {
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _correct = false;
  String _feedback = 'Guess the Characters';

  final String requiredValue = 'GAME';

  void clearText() {
    _textController.clear();
  }

  downloadFile(url) {
  AnchorElement anchorElement = new AnchorElement(href: url);
  anchorElement.download = "BG1";
  anchorElement.click();
}

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 150),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 25,
            width: Size.infinite.width,
            decoration: BoxDecoration(
              //border: Border.all(color: Color(0xFFF0E417,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: _correct ? Color(0xFFF0E417) : Colors.transparent,
            ),
            child: Center(
              child: Text(
                _feedback,
                style: TextStyle(color: _correct ? Colors.black : Colors.white, fontSize: 20, fontFamily: 'NovaSquare'),
              ),
            ),
          ),
          
          PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) => print(value),
                autoFocus: true,
                focusNode: _focusNode,
                autoDismissKeyboard: true,
                controller: _textController,
                textStyle: const TextStyle(color: Colors.white, fontSize: 30,fontFamily: 'NovaSquare'),
                pinTheme: PinTheme(
                  fieldHeight: MediaQuery.of(context).size.height * 0.05,
                  fieldWidth: MediaQuery.of(context).size.width * 0.05,
                  activeColor: Color(0xFFF0E417),
                  selectedColor: Color(0xFFF0E417),
                  inactiveColor: Colors.white
                ),
                inputFormatters: [
                  UpperCaseTextFormatter(),
                ],
                onCompleted: (value) {
                  setState(() {
                    if (value == requiredValue) {
                      _feedback = 'Correct!';
                      _correct = true;
                      context.read<QuizTracker>().state = QuizState.Third;
                      Navigator.pushNamed(context,
                                      MailScreen.routeName);
                      print(_feedback);
                    } else {
                      _feedback = 'wrong!';
                      _correct = false;
                      print(_feedback);
                      clearText();
                      _focusNode.requestFocus();
                    }
                  });
                },
              ),
              ElevatedButton(onPressed: () => downloadFile("assets/Letters3.png"),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFF0E417)),
                        primary: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)), 
                      child: Text('Download', style: TextStyle(color: Color(0xFFF0E417)),))
           
          
        ],
      ),
    );
  }
}
