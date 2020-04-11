import 'package:codiv91/loading_screen_India.dart';
import 'package:flutter/material.dart';
import 'loading_screen_world.dart';

class choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Stats for India'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoadingScreenIndia()));
              },
            ),
            FlatButton(
              child: Text('Stats for World'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoadingScreenWorld()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
