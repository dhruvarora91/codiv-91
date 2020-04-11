import 'package:flutter/material.dart';
import 'networking.dart';
import 'World_Stats.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenWorld extends StatefulWidget {
  @override
  _LoadingScreenWorldState createState() => _LoadingScreenWorldState();
}

class _LoadingScreenWorldState extends State<LoadingScreenWorld> {
  @override
  void initState() {
    super.initState();
    getStatsWorld();
  }

  NetworkHelper networkHelperWorld =
      NetworkHelper('https://api.thevirustracker.com/free-api?global=stats');

  void getStatsWorld() async {
    var stats = await networkHelperWorld.getData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => WorldStats(stats)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitRotatingPlain(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
