import 'package:flutter/material.dart';

import '../constants.dart';

class Factors extends StatelessWidget {
  Factors({@required this.icon, @required this.value, @required this.color});
  final IconData icon;
  final int value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 50.0,
          color: color,
        ),
        Text(
          value.toString(),
          style: kPointsTextStyle,
        ),
      ],
    );
  }
}
