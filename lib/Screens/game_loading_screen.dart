import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'mainPage.dart';
import 'package:audioplayers/audio_cache.dart';

final player = AudioCache();

class GameLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    player.loop('timerider.mp3');

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 500),
            totalRepeatCount: 1,
            text: ['CODIV-91'],
            textStyle: TextStyle(
                color: Colors.red, fontSize: 50.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart,
            onFinished: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Codiv()));
            },
          ),
        ),
      ),
    );
  }
}
