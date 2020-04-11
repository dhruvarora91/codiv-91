import 'package:codiv91/News_Page.dart';
import 'package:codiv91/Stats_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: ReusableCard(
                colorChoice: Colors.blueGrey,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Game Version'),
                          Text('1.0.0'),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Music'),
                          Icon(Icons.volume_mute),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Sound Effects'),
                          Icon(Icons.music_note),
                        ],
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colorChoice: Colors.blueGrey,
                cardChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsScreen()));
                      },
                      child: Icon(Icons.info),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Icon(Icons.format_list_numbered),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Column(
//children: <Widget>[
//Expanded(
//flex: 5,
//child: Column(
//children: <Widget>[
//Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Text('Game Version'),
//Text('1.0.0'),
//],
//),
//Row(
//children: <Widget>[
//Text('Settings 1'),
//],
//),
//Row(
//children: <Widget>[
//Text('Settings 1'),
//],
//),
//Row(
//children: <Widget>[
//Text('Settings 1'),
//],
//),
//],
//),
//),
//Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//FlatButton(
//onPressed: () {
//Navigator.push(context,
//MaterialPageRoute(builder: (context) => NewsScreen()));
//},
//child: Icon(Icons.info),
//),
//FlatButton(
//onPressed: () {
//Navigator.push(context,
//MaterialPageRoute(builder: (context) => MainScreen()));
//},
//child: Icon(Icons.format_list_numbered),
//),
//],
//),
//],
//),
