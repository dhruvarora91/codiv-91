import 'package:codiv91/Screens/graph_page.dart';
import 'package:codiv91/Screens/mainPage.dart';
import 'package:codiv91/Services/Network_Helper.dart';
import 'package:flutter/material.dart';

DateTime currentDate = DateTime.now().add(Duration(days: -2));
List<int> totalCases = [];
List<int> totalRecovered = [];
List<int> totalDeaths = [];

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
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.thevirustracker.com/free-api?countryTimeline=IN');
    var graphData = await networkHelper.getData();
    for (DateTime date1 = DateTime(2020, 2, 01); date1.isBefore(currentDate); date1 = date1.add(Duration(days: 1))) {
      // print('andar');
      if (date1.day < 10) {
        totalCases.add(graphData['timelineitems'][0]['${date1.month}/0${date1.day}/20']['total_cases']);
        totalRecovered.add(graphData['timelineitems'][0]['${date1.month}/0${date1.day}/20']['total_recoveries']);
        totalDeaths.add(graphData['timelineitems'][0]['${date1.month}/0${date1.day}/20']['total_deaths']);
      } 
      else {
        totalCases.add(graphData['timelineitems'][0]['${date1.month}/${date1.day}/20']['total_cases']);
        totalRecovered.add(graphData['timelineitems'][0]['${date1.month}/${date1.day}/20']['total_recoveries']);
        totalDeaths.add(graphData['timelineitems'][0]['${date1.month}/${date1.day}/20']['total_deaths']);
      }
    }
    // print(totalData);
    // print('bahar');
    Navigator.push(context, MaterialPageRoute(builder: (context) => GraphPage(totalCases, totalRecovered, totalDeaths)));

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Loading'),
    );
  }
}
