import 'dart:html';

import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/MessageScreen/message_screen.dart';
import 'package:video_player_web/video_player_web.dart';
import 'package:video_player/video_player.dart';


class VideoPlayer1 extends StatefulWidget {
  const VideoPlayer1({ Key? key }) : super(key: key);
  

  @override
  State<VideoPlayer1> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<VideoPlayer1> {
  late VideoPlayerController _controller2;
  String goOn = '';

  @override
  void initState(){
    super.initState();
    
    _controller2 = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    ..addListener(() {
        final bool isPlaying = _controller2.value.isPlaying;
        if(_controller2.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
            print('video Started');
        }

        if(_controller2.value.position == _controller2.value.duration) {
            print('video Ended');
            goOn = 'Hello';
            Navigator.pushNamed(context,"/videoscreen/messagescreen");
            //if(goOn == 'Hello'){
            //  Navigator.pushNamed(context,"/videoscreen/messagescreen");
            //}
            
        }

        })
    ..initialize().then((value) 
    => {
      _controller2.setVolume(0),
      _controller2.play() 
      
      }
    );
  }

  void checkVideo(){
    // Implement your calls inside these conditions' bodies : 
    if(_controller2.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if(_controller2.value.position == _controller2.value.duration) {
      print('video Ended');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: VideoPlayer(_controller2)
    );
  }
}