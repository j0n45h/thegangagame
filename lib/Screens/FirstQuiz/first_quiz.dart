import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstQuiz extends StatefulWidget {
  static const String routeName = "/videoscreen/messagescreen/firstquiz";
  const FirstQuiz({ Key? key }) : super(key: key);

  @override
  State<FirstQuiz> createState() => _FirstQuizState();
}

class _FirstQuizState extends State<FirstQuiz> {

   
  late FocusNode thirdFocusNode;
  late FocusNode secondFocusNode;

  String feedback = 'Hello1';
  final String requiredValue = 'secret words';
  final String requiredValue2 = 'secretwords';
  

  final _teController = TextEditingController();

  void clearText() {
    _teController.clear();
  }

  
  
  void clearText2() {
    _teController.clear();
  }

  @override
  void initState() {
    super.initState();
    secondFocusNode = FocusNode();
    thirdFocusNode = FocusNode();
  }

   @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    thirdFocusNode.dispose();
    secondFocusNode.dispose();

    super.dispose();
  }

  void refocus(){
     FocusScope.of(context).requestFocus(secondFocusNode);
        Timer(const Duration(milliseconds: 1), () {
        FocusScope.of(context).requestFocus(thirdFocusNode);
        });
     
  }

  void buttonAction(){
    print('nice');
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: (
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SvgPicture.asset(
                'assets/Quiz_1/ThirdPost(QueerFormat)Kopie.svg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.fill,
              ),
              ),
              
              Positioned(
                left: MediaQuery.of(context).size.width*0.25,
                top: MediaQuery.of(context).size.height*0.2,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: MediaQuery.of(context).size.width*0.1,
                  alignment: Alignment.center ,
                  color: Colors.transparent,
                  child: RichText(text: TextSpan(
                    text: '1. to advance use the',
                    style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: 'NovaSquare'),
                    children: <TextSpan>[
                      TextSpan(text: ' secret words', style: TextStyle(color: Color(0xFFF0E417), fontSize: 40,fontFamily: 'NovaSquare')),
                      TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 40,fontFamily: 'NovaSquare'))
                    ]
                  )
                  )
                  
                )
              ),
              Positioned(
                left: MediaQuery.of(context).size.width*0.35,
                top: MediaQuery.of(context).size.height*0.5,
                child: 
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.width*0.1,
                  alignment: Alignment.center ,
                  color: Colors.transparent,
                    child: (Column(children: [
                      TextField(
                      autofocus: true,
                      focusNode: thirdFocusNode,
                      controller: _teController,
                      cursorColor: Color(0xFFF0E417),
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                      ),
                      onSubmitted: (value){
                        setState(() {
                          value= value.toLowerCase();
                                  if (value==requiredValue || value ==requiredValue2 ) {
                                  feedback = 'Correct!';
                                  print(feedback);
                                  Navigator.pushNamed(context,"/videoscreen/messagescreen/firstquiz/secondquiz");

                                } else {
                                  feedback = 'wrong!';
                                  print('wrong!');
                                  
                                  _teController.clear();
                                  refocus();
                                }
                            }
                          );
                      },
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
                        hintText: '',
                        ),
                        
                      ),
                       
                    ],
                    )
                  )
                ) 
              ),
              Positioned(
                right: MediaQuery.of(context).size.width*0.07,
                bottom: MediaQuery.of(context).size.width*0.07,
                
                child: 
                Container(
                  height: 50,
                  width: 50,
                  child: Visibility(
                          visible: false,
                          child: TextField(
                          focusNode: secondFocusNode,
                        ))
                  
                  
                )
              )
            ],
          )
        ),
      ),
    );
  }
}