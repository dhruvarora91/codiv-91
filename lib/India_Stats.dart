import 'dart:convert';
import 'package:flutter/material.dart';
import 'networking.dart';

int totalIndia, recoveredIndia, deathsIndia;

class IndiaStats extends StatefulWidget {
  IndiaStats(this.stats);
  final stats;
  @override
  _IndiaStatsState createState() => _IndiaStatsState();
}

class _IndiaStatsState extends State<IndiaStats> {
  void updateUIIndia(statsData) {
    setState(() {
      if (statsData == null) {
        totalIndia = 0;
        recoveredIndia = 0;
        deathsIndia = 0;
      } else {
        totalIndia = statsData['countrydata'][0]['total_cases'];
        recoveredIndia = statsData['countrydata'][0]['total_recovered'];
        deathsIndia = statsData['countrydata'][0]['total_deaths'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUIIndia(widget.stats);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text('Total Cases in India : $totalIndia'),
                Text('Recovered Cases in India: $recoveredIndia'),
                Text('Deaths in India : $deathsIndia'),
//                FlatButton(
//                  onPressed: () async {
//                    // TODO: set
////                      var statsData = await getStatsIndia();
////                      updateUIIndia(statsData);
//                  },
//                  child: Text('Update results for India'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
