import 'dart:async';
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
  late VideoPlayerController _videoController;

  @override
  void initState(){
    super.initState();
    
    _videoController = VideoPlayerController.asset('assets/Video/Intro-Site-Teaser02-h264.mp4')
    ..addListener(() {
        final bool isPlaying = _videoController.value.isPlaying;
        if(_videoController.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
            print('video Started');
        }

        if(_videoController.value.position == _videoController.value.duration) {
            print('video Ended');
            Navigator.pushNamed(context,"/videoscreen/messagescreen");
            //if(goOn == 'Hello'){
            //  Navigator.pushNamed(context,"/videoscreen/messagescreen");
            //}
            
        }

        })
    ..initialize().then((value) {
        if (ModalRoute.of(context)?.isCurrent ?? false){
          _videoController.setVolume(0);
          _videoController.play();
          //Future.delayed(Duration(seconds: 3)).then((_) => _videoController.setVolume(50));
        }
      }
    );
  }

  void checkVideo(){
    // Implement your calls inside these conditions' bodies : 
    if(_videoController.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }

    if(_videoController.value.position == _videoController.value.duration) {
      print('video Ended');
    }

  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: VideoPlayer(_videoController)
    );
  }
}