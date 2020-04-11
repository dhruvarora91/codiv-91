import 'package:codiv91/India_Stats.dart';
import 'package:flutter/material.dart';
import 'networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreenIndia extends StatefulWidget {
  @override
  _LoadingScreenIndiaState createState() => _LoadingScreenIndiaState();
}

class _LoadingScreenIndiaState extends State<LoadingScreenIndia> {
  @override
  void initState() {
    super.initState();
    getStatsIndia();
  }

  NetworkHelper networkHelperIndia =
      NetworkHelper('https://api.thevirustracker.com/free-api?countryTotal=IN');

  void getStatsIndia() async {
    var stats = await networkHelperIndia.getData();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IndiaStats(stats)));
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
