import 'loading_screen_world.dart';
import 'package:flutter/material.dart';

int totalWorld, recoveredWorld, deathsWorld;

LoadingScreenWorld loader = LoadingScreenWorld();

class WorldStats extends StatefulWidget {
  WorldStats(this.stats);
  final stats;
  @override
  _WorldStatsState createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> {
  void updateUIWorld(statsData) {
    setState(() {
      if (statsData == null) {
        totalWorld = 0;
        recoveredWorld = 0;
        deathsWorld = 0;
      } else {
        totalWorld = statsData['results'][0]['total_cases'];
        recoveredWorld = statsData['results'][0]['total_recovered'];
        deathsWorld = statsData['results'][0]['total_deaths'];
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateUIWorld(widget.stats);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text('Total Cases in World : $totalWorld'),
            Text('Recovered Cases in World: $recoveredWorld'),
            Text('Deaths in World : $deathsWorld'),
//            FlatButton(
//              onPressed: () async {
////                      var statsData = await loader.;
////                      updateUIWorld(statsData);
//              },
//              child: Text('Update results for World'),
//            ),
          ],
        ),
      ),
    );
  }
}
