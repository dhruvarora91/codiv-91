import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'constants.dart';

int moneyVar = 20;

enum dir { left, right }

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> cardImages = [
    'images/characterimg1.png',
    'images/characterimg2.png',
    'images/characterimg3.png',
    'images/characterimg4.png',
    'images/characterimg5.png',
    'images/characterimg1.png',
    'images/characterimg2.png',
    'images/characterimg3.png',
    'images/characterimg4.png',
    'images/characterimg5.png',
  ];

  @override
  Widget build(BuildContext context) {
    final int personVar = 20;
    final int foodVar = 20;
    final int healthVar = 20;
    CardController controller; //Use this to trigger swap.
    dir direction;
    AlignmentGeometry a = Alignment.topCenter;

    String choice = "";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Factors(
                        icon: Icons.attach_money,
                        value: moneyVar,
                      ),
                      Factors(
                        icon: Icons.person_outline,
                        value: personVar,
                      ),
                      Factors(
                        icon: Icons.restaurant,
                        value: foodVar,
                      ),
                      Factors(
                        icon: Icons.local_hospital,
                        value: healthVar,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'question\nquestion\nquestion\nquestion\nquestion\n',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: TinderSwapCard(
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: cardImages.length,
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width * 1.0,
                        maxHeight: MediaQuery.of(context).size.width * 1.4,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                        minHeight: MediaQuery.of(context).size.width * 0.7,
                        cardBuilder: (context, index) => Card(
                              child: Stack(
                                children: <Widget>[
                                  Image.asset('${cardImages[index]}'),
                                  Container(
                                      alignment: a,
                                      child: Text(
                                        'choice',
                                        style: TextStyle(
                                            color: Colors.pink,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22.0),
                                      )),
                                ],
                              ),
                            ),
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          setState(() {
//                            if (align.x == 0) {
//                              choice = '';
//                            }
                            if (align.x < 0) {
                              //Card is LEFT swiping
                              print('Going left');
                              choice = 'choice left';
                              a = Alignment.topRight;
//
//                              align = Alignment.topRight;
                            } else if (align.x > 0) {
                              //Card is RIGHT swiping
                              print('Going right');

                              choice = 'choice right';

                              a = Alignment.topLeft;
                            }
                          });
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          /// Get orientation & index of swiped card!

                          if (orientation == CardSwipeOrientation.LEFT) {
                            setState(() {
                              moneyVar++;
                            });
                            print('went left');
                          } else if (orientation ==
                              CardSwipeOrientation.RIGHT) {
                            setState(() {
                              moneyVar--;
                            });
                            print('went right');
                          }
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Text(
                      'character name',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
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

class Factors extends StatelessWidget {
  Factors({@required this.icon, @required this.value});
  final IconData icon;
  int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 50.0,
          color: Colors.grey,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
      ],
    );
  }
}
