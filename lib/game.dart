import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'constants.dart';
import 'factors.dart';
import 'story_brain.dart';

enum dir { left, right }
int moneyVar = 20;

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

StoryBrain storyBrain = StoryBrain();

class _GamePageState extends State<GamePage> {
  List<InteractiveCard> characterCards = [
    InteractiveCard(cardImage: 'images/characterimg1.png'),
    InteractiveCard(cardImage: 'images/characterimg2.png'),
    InteractiveCard(cardImage: 'images/characterimg3.png'),
    InteractiveCard(cardImage: 'images/characterimg4.png'),
    InteractiveCard(cardImage: 'images/characterimg5.png'),
    InteractiveCard(cardImage: 'images/characterimg1.png'),
    InteractiveCard(cardImage: 'images/characterimg2.png'),
    InteractiveCard(cardImage: 'images/characterimg3.png'),
    InteractiveCard(cardImage: 'images/characterimg4.png'),
    InteractiveCard(cardImage: 'images/characterimg5.png'),
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
                      storyBrain.getQuestion(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: TinderSwapCard(
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: storyBrain.getLength(),
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width * 1.0,
                        maxHeight: MediaQuery.of(context).size.width * 1.4,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                        minHeight: MediaQuery.of(context).size.width * 0.7,
                        cardBuilder: (context, index) {
                          return Image.asset(storyBrain.getImg());
                        },
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
//                              characterCards[index].updateAxisPosition(i)
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
//                          print(index);
                          storyBrain.updateIndex(index + 1);

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
                      storyBrain.getName(),
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

//Switch this to stateful widget
class InteractiveCard extends StatelessWidget {
  InteractiveCard({
    @required this.cardImage,
//    @required this.index,
  });

  final String cardImage;
//  final int index;
  AlignmentGeometry axisPosition;

  void updateAxisPosition(d) {
    if (d == dir.left) {
      axisPosition = Alignment.topRight;
    }
    if (d == dir.right) {
      axisPosition = Alignment.topLeft;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          Image.asset(cardImage),
          Container(
              alignment: axisPosition,
              child: Text(
                'choice',
                style: TextStyle(
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0),
              )),
        ],
      ),
    );
  }
}
