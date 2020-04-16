import 'package:flutter/material.dart';

import 'Screens/mainPage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
      home: Codiv(),
//      initialRoute: '/fifth',
//      routes: {
//        '/': (context) => Codiv(),
//        '/first': (context) => GamePage(),
//        '/second': (context) => NewsArticle(),
//        '/third': (context) => NewsScreen(),
//        '/fourth': (context) => MainScreen(),
//        '/fifth': (context) => Navigation(),
//      },
    ),
  );
}
