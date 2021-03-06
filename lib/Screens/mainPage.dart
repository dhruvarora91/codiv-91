import 'package:codiv91/Screens/game.dart';
import 'package:codiv91/Screens/graph_loading_screen_new.dart';
import 'package:codiv91/Screens/graph_page.dart';
import 'package:codiv91/Screens/settings.dart';
import 'package:flutter/material.dart';
import '../Components/bottom_button.dart';
// import 'package:audioplayers/audio_cache.dart';

// final player = AudioCache();

// void playMusic() {
// player.play('timerider.mp3');
// }

class Codiv extends StatelessWidget {
  // playMusic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
                child: Icon(Icons.settings),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GraphPage()));
                },
                child: Image(
                  image: AssetImage("images/graph.gif"),
                ),
              ),
            ),
          ),
          Expanded(
            child: BottomButton(
              buttonTitle: 'PLAY',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GamePage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
