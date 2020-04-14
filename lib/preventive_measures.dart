import 'package:codiv91/constants.dart';
import 'package:codiv91/reusable_card.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Measures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Preventive Measures'),
        ),
        body: ReusableCard(
          colorChoice: kCardColorStats,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      cardChild: Image.asset('images/stayhome.png'))),
              SizedBox(height: 10.0),
              Expanded(
                  child:
                      ReusableCard(cardChild: Image.asset('images/wash.png'))),
            ],
          ),
        ),
      ),
    );
  }
}
