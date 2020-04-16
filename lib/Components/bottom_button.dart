import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle, this.onTap});

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.red,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 10.0,
      ),
    );
  }
}
