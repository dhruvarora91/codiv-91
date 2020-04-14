import 'package:codiv91/News_Page.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'mainPage.dart';
import 'package:codiv91/News_Article.dart';
import 'package:codiv91/News_Page.dart';
import 'Stats_Page.dart';

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
