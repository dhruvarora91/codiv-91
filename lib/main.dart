import 'package:flutter/material.dart';
import 'package:codiv91/Screens/graph.dart';
import 'Screens/mainPage.dart';
import 'Screens/game_loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
//      home: LineChartSample1(),
      // home: Codiv(),
      home: GameLoadingScreen(),
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
