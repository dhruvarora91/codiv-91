import 'package:codiv91/game.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'choice.dart';

class Codiv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Center(child: Text("Codiv-91")),
//      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => choice()));
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
