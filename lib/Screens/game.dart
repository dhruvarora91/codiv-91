import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Components/factors.dart';
import '../Components/story_brain.dart';

enum dir { left, right }

int moneyVar, personVar, foodVar, healthVar;
Color moneyColor, personColor, foodColor, healthColor;

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
    moneyColor = Colors.grey;
    personColor = Colors.grey;
    foodColor = Colors.grey;
    healthColor = Colors.grey;
    storyBrain.updateIndex(0);
  }

  void colorBlink(int factor, int change) {
    Color newColor;
    if (change > 0)
      newColor = Colors.green;
    else if (change < 0)
      newColor = Colors.red;
    else
      newColor = Colors.grey;

    switch (factor) {
      case 1:
        moneyColor = newColor;
        break;
      case 2:
        personColor = newColor;
        break;
      case 3:
        foodColor = newColor;
        break;
      case 4:
        healthColor = newColor;
        break;
    }
  }

  void returnToMain() {
    Navigator.pop(context);
  }

  void showAlert(
      {String msg, String des, String btnText, AlertType alertType}) {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.white,
        isCloseButton: false,
      ),
      context: context,
      type: alertType,
      title: msg,
      desc: des,
      buttons: [
        DialogButton(
          color: Colors.teal.shade900,
          child: Text(
            btnText,
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
      showAlert(
        msg: 'You have lost the game',
        des: 'Economy has crashed',
        btnText: 'Try Again',
        alertType: AlertType.error,
      );
    else if (personVar <= 0)
      showAlert(
        msg: 'You have lost the game',
        des: 'Public opinion about you has diminished',
        btnText: 'Try Again',
        alertType: AlertType.error,
      );
    else if (foodVar <= 0)
      showAlert(
        msg: 'You have lost the game',
        des: 'Citizens are starving.',
        btnText: 'Try Again',
        alertType: AlertType.error,
      );
    else if (healthVar <= 0)
      showAlert(
        msg: 'You have lost the game',
        des: 'All the citizens have been affected by the virus',
        btnText: 'Try Again',
        alertType: AlertType.error,
      );
    else if (storyBrain.cardsOver(index))
      showAlert(
        msg: 'GAME OVER',
        des: 'YOU HAVE WON',
        btnText: 'Play Again',
        alertType: AlertType.success,
      );
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
                        color: moneyColor,
                      ),
                      Factors(
                        icon: Icons.person_outline,
                        value: personVar,
                        color: personColor,
                      ),
                      Factors(
                        icon: Icons.restaurant,
                        value: foodVar,
                        color: foodColor,
                      ),
                      Factors(
                        icon: Icons.local_hospital,
                        value: healthVar,
                        color: healthColor,
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
                              colorBlink(1, storyBrain.updateMoneyLeft());

                              personVar += storyBrain.updatePersonLeft();
                              colorBlink(2, storyBrain.updatePersonLeft());

                              foodVar += storyBrain.updateFoodLeft();
                              colorBlink(3, storyBrain.updateFoodLeft());

                              healthVar += storyBrain.updateHealthLeft();
                              colorBlink(4, storyBrain.updateHealthLeft());
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  moneyColor = Colors.grey;
                                  personColor = Colors.grey;
                                  foodColor = Colors.grey;
                                  healthColor = Colors.grey;
                                });
                              });

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
                              colorBlink(1, storyBrain.updateMoneyRight());

                              personVar += storyBrain.updatePersonRight();
                              colorBlink(2, storyBrain.updatePersonRight());

                              foodVar += storyBrain.updateFoodRight();
                              colorBlink(3, storyBrain.updateFoodRight());

                              healthVar += storyBrain.updateHealthRight();
                              colorBlink(4, storyBrain.updateHealthRight());
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                setState(() {
                                  moneyColor = Colors.grey;
                                  personColor = Colors.grey;
                                  foodColor = Colors.grey;
                                  healthColor = Colors.grey;
                                });
                              });

                              checkFactors(index);
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
