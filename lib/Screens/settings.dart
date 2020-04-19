import 'package:codiv91/Screens/News_Page.dart';
import 'package:codiv91/Screens/preventive_measures.dart';
import 'package:codiv91/Screens/stats_loading_screen.dart';
import 'package:codiv91/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Stats_Page.dart';
import '../Components/audio.dart';

import '../Components/reusable_card.dart';
import 'stats_loading_screen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}

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
                colorChoice: kCardColorStats,
                cardChild: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Game Version',
                            style: kSettingsTextStyle,
                          ),
                          Text(
                            '1.0.0',
                            style: kSettingsTextStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Music',
                            style: kSettingsTextStyle,
                          ),
                          GestureDetector(
                            onTap: () {
                              playnpause();
                            },
                            child: Icon(
                              Icons.volume_mute,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _handleSignIn();
                            },
                            child: Text(
                              'Login with Google',
                              style: kSettingsTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colorChoice: kCardColorStats,
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
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Measures()));
                      },
                      child: Icon(Icons.message),
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
