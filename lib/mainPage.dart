import 'package:codiv91/game.dart';
import 'package:codiv91/settings.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

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
              child: Image(
                image: AssetImage("images/graph.gif"),
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
