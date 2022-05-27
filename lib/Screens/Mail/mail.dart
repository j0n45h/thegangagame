import 'package:flutter/material.dart';
import 'package:thegangagame/Util/register_new_user.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  final _emailTfController = TextEditingController();

  @override
  void dispose() {
    _emailTfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RichText(
            text: const TextSpan(
              text: "Congratulations, you've passed the first stage!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'NovaSquare',
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Color(0xFFF0E417),
                    fontSize: 40,
                    fontFamily: 'NovaSquare',
                  ),
                ),
                TextSpan(
                  text: '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'NovaSquare',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.width * 0.2,
            padding: const EdgeInsets.all(80.0),
            child: TextField(
              controller: _emailTfController,
              onSubmitted: _submit,
              cursorColor: const Color(0xFFF0E417),
              style: const TextStyle(fontSize: 30, color: Colors.white),
              autofocus: true,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xFFF0E417))),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Color(0xFFF0E417))),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white)),
                hintText: 'Enter your E-Mail',
                hintStyle: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 214, 200, 200),
                    fontFamily: 'NovaSquare'),
              ),
            ),
          ),
          MaterialButton(
            child: const Text(
              'Submit',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'NovaSquare',
                fontSize: 28,
              ),
            ),
            color: const Color(0xFFF0E417),
            onPressed: () => _submit(_emailTfController.text),
          ),
        ],
      ),
    );
  }

  Future<void> _submit(String mailAddress) async {
    if (!(mailAddress.contains('@') && mailAddress.contains('.'))) {
      _showPopup("Not a Valid EMail Address!");
      return;
    }

    if (!await RegisterNewUser.tryRegisterEMail(mailAddress)) {
      _showPopup("Server Error!");
    }
  }

  void _showPopup(String reason) {
    // TODO: Popup
    print(reason);
  }
}
