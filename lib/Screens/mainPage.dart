import 'package:codiv91/Screens/game.dart';
import 'package:codiv91/Screens/graph_loading_screen_new.dart';
import 'package:codiv91/Screens/graph_page.dart';
import 'package:codiv91/Screens/settings.dart';
import 'package:flutter/material.dart';


import '../Components/bottom_button.dart';

class Codiv extends StatelessWidget {
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
                      MaterialPageRoute(builder: (context) => GraphLoadingScreen()));
                },
                child: Image(
                  image: AssetImage("images/graph.gif"),
                ),
              ),
//              child: LineChartSample1(),
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
