import 'package:codiv91/Screens/graph_page.dart';
import 'package:codiv91/Screens/mainPage.dart';
import 'package:codiv91/Services/Network_Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

DateTime currentDate = DateTime.now().add(Duration(days: -2));

class GraphLoadingScreen extends StatefulWidget {
  @override
  _GraphLoadingScreenState createState() => _GraphLoadingScreenState();
}

class _GraphLoadingScreenState extends State<GraphLoadingScreen> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    List<int> totalCases = [];
    List<int> totalRecovered = [];
    List<int> totalDeaths = [];
    print('Current Date $currentDate');
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.covid19api.com/country/india?from=2020-02-01T00:00:00Z&to=${currentDate.toIso8601String()}');
    var graphData = await networkHelper.getData();

    for (var i = 0; i < graphData.length; i++) {
      totalCases.add(graphData[i]['Confirmed']);
      totalRecovered.add(graphData[i]['Recovered']);
      totalDeaths.add(graphData[i]['Deaths']);
    }
    print(totalCases);
    print(totalRecovered);
    print(totalDeaths);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GraphPage(totalCases, totalRecovered, totalDeaths)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
