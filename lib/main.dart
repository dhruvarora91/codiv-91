import 'package:codiv91/loading_screen_India.dart';
import 'package:codiv91/loading_screen_world.dart';
import 'package:flutter/material.dart';
import 'game.dart';
import 'mainPage.dart';
import 'India_Stats.dart';
import 'networking.dart';
import 'loading_screen_India.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,
      ),
      home: Codiv(),
    ),
  );
}
