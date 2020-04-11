import 'dart:convert';
import 'package:flutter/material.dart';
import 'networking.dart';

int total, recovered, deaths;

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  NetworkHelper networkHelperIndia =
      NetworkHelper('https://api.thevirustracker.com/free-api?countryTotal=IN');
  Future getStats() async {
    var stats = await networkHelperIndia.getData();
    return stats;
  }

  void updateUI(statsData) {
    setState(() {
      if (statsData == null) {
        total = 0;
        recovered = 0;
        deaths = 0;
      } else {
        total = statsData['countrydata'][0]['total_cases'];
        recovered = statsData['countrydata'][0]['total_recovered'];
        deaths = statsData['countrydata'][0]['total_deaths'];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getStats();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text('Total Cases : $total'),
            Text('Recovered Cases : $recovered'),
            Text('Deaths : $deaths'),
            FlatButton(
              onPressed: () async {
                var statsData = await getStats();
                updateUI(statsData);
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
