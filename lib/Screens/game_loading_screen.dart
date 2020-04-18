import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GameLoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: Center(child: TypewriterAnimatedTextKit(
          text: ['CODIV-91', 'BY-VAIBHAV SAHNI', 'BY-SHAORYA RAJ', 'BY-DHRUV ARORA'],
          textStyle: TextStyle(color: Colors.red, fontSize: 50.0),
          textAlign: TextAlign.start,
      alignment: AlignmentDirectional.topStart),
      ),
      ),
    );
  }
}