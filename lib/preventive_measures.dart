import 'package:codiv91/constants.dart';
import 'package:codiv91/reusable_card.dart';
import 'package:flutter/material.dart';

class Measures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ReusableCard(
          colorChoice: kCardColorStats,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Wash your Hands',),
              Text('Ghar mai baith'),
              Text('Stay at home'),
            ],
          ),
        ),
      ),
    );
  }
}
