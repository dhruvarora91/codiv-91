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
    ),
  );
}
