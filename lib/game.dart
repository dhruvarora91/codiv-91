import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'constants.dart';
import 'factors.dart';
import 'story_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum dir { left, right }

int moneyVar, personVar, foodVar, healthVar;

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

StoryBrain storyBrain = StoryBrain();

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    super.initState();
    resetValue();
  }

  void resetValue() {
    moneyVar = 20;
    personVar = 20;
    foodVar = 20;
    healthVar = 20;
  }

  void returnToMain() {
    Navigator.pop(context);
  }

  void showAlert({String msg, String des}) {
    Alert(
      context: context,
      type: AlertType.error,
      title: msg,
      desc: des,
      buttons: [
        DialogButton(
          child: Text(
            "WANNA TRY AGAIN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
            returnToMain();
          },
          width: 120,
        )
      ],
    ).show();
  }

//|| personVar <= 0 || foodVar <= 0 || healthVar <= 0
  void checkFactors(int index) {
    if (moneyVar <= 0)
      showAlert(msg: 'You have lost the game', des: 'Economy has crashed');
    else if (personVar <= 0)
      showAlert(
          msg: 'You have lost the game',
          des: 'Public opinion about you has diminished');
    else if (foodVar <= 0)
      showAlert(msg: 'You have lost the game', des: 'Citizens are starving.');
    else if (healthVar <= 0)
      showAlert(
          msg: 'You have lost the game',
          des: 'All the citizens have been affected by the virus');
    else if (storyBrain.cardsOver(index))
      showAlert(msg: 'GAME OVER', des: 'YOU HAVE WON');
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        storyBrain.getQuestion(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: TinderSwapCard(
                        orientation: AmassOrientation.BOTTOM,
                        totalNum: storyBrain.getLength(),
                        stackNum: 3,
                        swipeEdge: 4.0,
                        maxWidth: MediaQuery.of(context).size.width * 0.9,
                        maxHeight: MediaQuery.of(context).size.width * 1.4,
                        minWidth: MediaQuery.of(context).size.width * 0.5,
                        minHeight: MediaQuery.of(context).size.width * 0.7,
                        cardBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              Image.asset(storyBrain.getImg()),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    storyBrain.getChoice1(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    storyBrain.getChoice2(),
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0),
                                  )),
                            ],
                          );
                        },
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          setState(() {
                            if (align.x == 0) {
                              choice = 'yo';
                            }
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
                              moneyVar += storyBrain.updateMoneyLeft();
                              personVar += storyBrain.updatePersonLeft();
                              foodVar += storyBrain.updateFoodLeft();
                              healthVar += storyBrain.updateHealthLeft();
                              checkFactors(index);
                            });
                            // setState(() {
                            //   moneyVar++;
                            // });
                            print('went left');
                          } else if (orientation ==
                              CardSwipeOrientation.RIGHT) {
                            setState(() {
                              moneyVar += storyBrain.updateMoneyRight();
                              personVar += storyBrain.updatePersonRight();
                              foodVar += storyBrain.updateFoodRight();
                              healthVar += storyBrain.updateHealthRight();
                              checkFactors(index + 1);
                            });
//                            setState(() {
//                              moneyVar--;
//                            });
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
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
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
