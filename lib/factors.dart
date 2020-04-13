import 'package:flutter/material.dart';
import 'constants.dart';

class Factors extends StatelessWidget {
  Factors({@required this.icon, @required this.value});
  final IconData icon;
  final int value;

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
