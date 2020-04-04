import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'constants.dart';

class GamePage extends StatelessWidget {
  List<String> cardImages = [
    'images/characterimg1.png',
    'images/characterimg2.png',
    'images/characterimg3.png',
    'images/characterimg4.png',
    'images/characterimg5.png',
  ];
  @override
  Widget build(BuildContext context) {
    final int moneyVar = 20;
    final int personVar = 20;
    final int foodVar = 20;
    final int healthVar = 20;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        size: 50.0,
                        color: Colors.red,
                      ),
                      Text(
                        moneyVar.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        size: 50.0,
                        color: Colors.red,
                      ),
                      Text(
                        personVar.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.restaurant,
                        size: 50.0,
                        color: Colors.red,
                      ),
                      Text(
                        foodVar.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(
                        Icons.local_hospital,
                        size: 50.0,
                        color: Colors.red,
                      ),
                      Text(
                        healthVar.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Expanded(
              flex: 5,
              child: TinderSwapCard(
                orientation: AmassOrientation.BOTTOM,
                totalNum: cardImages.length,
                stackNum: 3,
                swipeEdge: 4.0,
                maxWidth: MediaQuery.of(context).size.width * 0.9,
                maxHeight: MediaQuery.of(context).size.width * 0.9,
                minWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: MediaQuery.of(context).size.width * 0.8,
                cardBuilder: (context, index) => Card(
                  child: Image.asset('${cardImages[index]}'),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

//Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Icon(Icons.attach_money),
//Icon(Icons.person_outline),
//Icon(Icons.fastfood),
//Icon(Icons.local_hospital),
//],
//),
