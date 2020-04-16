import 'package:codiv91/Screens/Stats_Page.dart';
import 'package:codiv91/Services/Network_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StatsLoadingScreen extends StatefulWidget {
  @override
  _StatsLoadingScreenState createState() => _StatsLoadingScreenState();
}

class _StatsLoadingScreenState extends State<StatsLoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    NetworkHelper covidDataGlobal =
        NetworkHelper('https://thevirustracker.com/free-api?global=stats');
    NetworkHelper covidDataIndia =
        NetworkHelper('https://thevirustracker.com/free-api?countryTotal=IN');
    var dataGlobal = await covidDataGlobal.getData();
    var dataIndia = await covidDataIndia.getData();
//  print('India Data : $dataIndia');
//  print('Global Data : $dataGlobal');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(dataGlobal, dataIndia)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loading Stats',
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(height: 20.0),
            SpinKitRotatingPlain(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
