import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thegangagame/Util/upper_case_text_formatter.dart';

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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(top: 180),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 25,
            width: Size.infinite.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: _correct ? Colors.greenAccent : Colors.indigoAccent,
            ),
            child: Center(
              child: Text(
                _feedback,
                style: TextStyle(color: _correct ? Colors.black : Colors.white, fontSize: 20),
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
            textStyle: const TextStyle(color: Colors.white),
            pinTheme: PinTheme(
              fieldHeight: MediaQuery.of(context).size.height * 0.07,
              fieldWidth: MediaQuery.of(context).size.width * 0.07,
              activeColor: Colors.indigo,
              inactiveColor: Colors.indigoAccent.withOpacity(0.3),
            ),
            inputFormatters: [
              UpperCaseTextFormatter(),
            ],
            onCompleted: (value) {
              setState(() {
                if (value == requiredValue) {
                  _feedback = 'Correct!';
                  _correct = true;
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
        ],
      ),
    );
  }
}
