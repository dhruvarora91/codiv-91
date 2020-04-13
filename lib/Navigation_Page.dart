import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Codiv'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            FlatButton(
              child: Text('Game Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/first');
              },
            ),
            FlatButton(
              child: Text('News Article'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            FlatButton(
              child: Text('News Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
            ),
            FlatButton(
              child: Text('Main Screen'),
              onPressed: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
          ],
        ),
      ),
    );
  }
}
