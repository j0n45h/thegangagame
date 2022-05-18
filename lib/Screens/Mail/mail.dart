import 'package:flutter/material.dart';


class Mail extends StatelessWidget {
  const Mail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          RichText(text: TextSpan(
                    text: "Congratulations, you've passed the first stage!",
                    style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'NovaSquare'),
                    children: <TextSpan>[
                      TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 40,fontFamily: 'NovaSquare')),
                      TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 40,fontFamily: 'NovaSquare'))
                    ]
                  )
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            height: MediaQuery.of(context).size.width*0.2,
            padding: const EdgeInsets.all(80.0),
            child:TextField(
              cursorColor: Color(0xFFF0E417),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),
              autofocus: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.white)
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Color(0xFFF0E417))
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Color(0xFFF0E417))
                          ) ,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.white)
                          ) ,
                          hintText: 'Enter your E-Mail',
                          hintStyle: TextStyle(fontSize: 30,
                          color: Color.fromARGB(255, 214, 200, 200),
                          fontFamily: 'NovaSquare'
                          ),
              
              )
            )
          )
        ],
      ),
      
    );
  }
}