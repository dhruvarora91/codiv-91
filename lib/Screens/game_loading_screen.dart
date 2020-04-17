import 'package:flutter/material.dart';
import 'package:codiv91/Services/Network_Helper.dart';
// import 'graph.dart';

DateTime currentDate = DateTime.now();
DateTime DateFormat = DateTime();

class kuchbhi {
  void updateUI(graphData) {
    // janTotalCases = graphData['timelineitems'][0]['1/31/20']['total_cases'];
    // janTotalRecoveries = graphData['timelineitems'][0]['1/31/20']['total_recoveries'];
    // janTotalDeaths = graphData['timelineitems'][0]['1/31/20']['total_deaths'];

    List totalData = [];
    // List totalRecoveries = [];
    // List totalDeaths = [];
// print(graphData['timelineitems'][0]['2/01/20']['total_cases']);

    for (DateTime date1 = DateTime(2020, 2, 01);
        date1.isBefore(currentDate);
        date1 = date1.add(Duration(days: 1))) {
      print(graphData['timelineitems'][0][DateFormat("dd/MM/yy").format(date1)]
          ['total_cases']);
    }

    // totalData.add(graphData['timelineitems'][0]['2/$i/20']['total_cases']);
    // print(totalData);
  }
}

kuchbhi k = kuchbhi();

class GameLoadingScreen extends StatefulWidget {
  @override
  _GameLoadingScreenState createState() => _GameLoadingScreenState();
}

class _GameLoadingScreenState extends State<GameLoadingScreen> {
  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.thevirustracker.com/free-api?countryTimeline=IN');
    var graphData = await networkHelper.getData();
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => LineChartSample1(graphData)));
    k.updateUI(graphData);
  }

  @override
  void initState() {
    super.initState();
    // getData();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Container(
      child: Text('Loading'),
    );
  }
}
