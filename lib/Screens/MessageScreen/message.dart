
import 'package:flutter/material.dart';


class Message extends StatelessWidget {
  
  const Message({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget> [
           Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2 ,color: Color(0xFFF0E417)),
                  ),
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
                  height: MediaQuery.of(context).size.width*0.25,
                  width: MediaQuery.of(context).size.width*0.4,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                                text: 'Welcome Player, \n',
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.013, fontFamily: 'NovaSquare'),
                                children: <TextSpan>[
                                  TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 35,fontFamily: 'NovaSquare')),
                                  TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 35,fontFamily: 'NovaSquare'))
                                ]
                              )
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                                  text: 'You have been choosen to participate in the preliminary round of the Ganga Game. There will be a number of task waiting for you to justify your participation. ',
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.013, fontFamily: 'NovaSquare'),
                                children: <TextSpan>[
                                  TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 35,fontFamily: 'NovaSquare')),
                                  TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 35,fontFamily: 'NovaSquare'))
                                ]
                              )
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                                text: 'Not everyone will make it through.',
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.013, fontFamily: 'NovaSquare'),
                                children: <TextSpan>[
                                  TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 35,fontFamily: 'NovaSquare')),
                                  TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 35,fontFamily: 'NovaSquare'))
                                ]
                              )
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                                text: '\n Solve the following three tasks to pass the first stage!',
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.013, fontFamily: 'NovaSquare'),
                                children: <TextSpan>[
                                  TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 35,fontFamily: 'NovaSquare')),
                                  TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 35,fontFamily: 'NovaSquare'))
                                ]
                              )
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                                text: '\n Good Luck, and remember: Always seize the opportunity to grow beyond the strings.',
                                style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.013, fontFamily: 'NovaSquare'),
                                children: <TextSpan>[
                                  TextSpan(text: '', style: TextStyle(color: Color(0xFFF0E417), fontSize: 35,fontFamily: 'NovaSquare')),
                                  TextSpan(text: '', style: TextStyle(color: Colors.white, fontSize: 35,fontFamily: 'NovaSquare'))
                                ]
                              )
                      ),
                    ],
                  ),
            ),
            Positioned(
              bottom: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Color(0xFFF0E417)),
                        primary: Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)
                ), 
                child: Text('Continue', style: TextStyle(color: Color(0xFFF0E417))
                ),
                onPressed: null,
              )
            )
      ]
    );
  }
}