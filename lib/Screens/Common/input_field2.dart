import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/ThirdQuiz/third_quiz.dart';
import 'package:thegangagame/Util/quiz_tracker.dart';

class InputField2 extends StatefulWidget {
  const InputField2({Key? key}) : super(key: key);

  @override
  _InputFielder createState() => _InputFielder();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class _InputFielder extends State<InputField2> {
  final _textController = TextEditingController();

  String userPost = 'Hello';
  String feedback = '';

  final String requiredValue = '9273';
  final _Value = TextEditingController();
  final _Focus = FocusNode();

  void clearText() {
    _Value.clear();
  }

  late FocusNode myFocusNode;

  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            bottom: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              child: (AspectRatio(
                  aspectRatio: 2 / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.03,
                          alignment: Alignment.topCenter,
                          color: Colors.transparent,
                          child: RichText(
                              text: TextSpan(
                            text: '2. The Numbers are hidden',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'NovaSquare'),
                          ))),
                      SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: (PinCodeTextField(
                            appContext: context,
                            length: 4,
                            onChanged: (value) {
                              print(value);
                            },
                            autoFocus: true,
                            enablePinAutofill: false,
                            focusNode: myFocusNode,
                            autoDismissKeyboard: true,
                            controller: _Value,
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: 'NovaSquare'),
                            pinTheme: PinTheme(
                                fieldHeight:
                                    MediaQuery.of(context).size.width * 0.07,
                                fieldWidth:
                                    MediaQuery.of(context).size.width * 0.07,
                                activeColor: Color(0xFFF0E417),
                                selectedColor: Color(0xFFF0E417),
                                inactiveColor: Colors.white),
                            inputFormatters: [
                              UpperCaseTextFormatter(),
                            ],
                            onCompleted: (value) {
                              setState(() {
                                if (value == requiredValue) {
                                  feedback = 'Correct';
                                  print(feedback);
                                  context.read<QuizTracker>().state =
                                      QuizState.Second;
                                  Navigator.pushNamed(context,
                                      ThirdQuiz.routeName);
                                } else {
                                  feedback = 'False';
                                  print('wrong!');
                                  clearText();
                                  myFocusNode.requestFocus();
                                }
                              });
                            },
                          ))),
                      Container(
                        //height: MediaQuery.of(context).size.height*0.2,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.transparent,
                        child: Center(
                          child: Text(
                            feedback,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'NovaSquare'),
                          ),
                        ),
                      ),
                    ],
                  ))),
            ))
      ],
    );
  }
}
