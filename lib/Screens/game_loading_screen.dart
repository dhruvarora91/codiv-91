import 'package:codiv91/Screens/mainPage.dart';
import 'package:codiv91/Services/Network_Helper.dart';
import 'package:flutter/material.dart';

DateTime currentDate = DateTime.now().add(Duration(days: -2));
//DateTime currentDate = DateTime(2020, 4, 16);
//DateTime DateFormat = DateTime();
List<int> totalData = [];

class GameLoadingScreenData {
  void updateUI(graphData) {
    // janTotalCases = graphData['timelineitems'][0]['1/31/20']['total_cases'];
    // janTotalRecoveries = graphData['timelineitems'][0]['1/31/20']['total_recoveries'];
    // janTotalDeaths = graphData['timelineitems'][0]['1/31/20']['total_deaths'];

    // List totalRecoveries = [];
    // List totalDeaths = [];
// print(graphData['timelineitems'][0]['2/01/20']['total_cases']);

//    for (DateTime date1 = DateTime(2020, 2, 01);
//        date1.isBefore(currentDate);
//        date1 = date1.add(Duration(days: 1))) {
//      if (date1.day < 10) {
//        totalData.add(graphData['timelineitems'][0]
//            ['${date1.month}/0${date1.day}/20']['total_cases']);
//
//      } else {
//        totalData.add(graphData['timelineitems'][0]
//            ['${date1.month}/${date1.day}/20']['total_cases']);
//      }
//    }
  }

  List getList() {
    return totalData;
  }
}

//GameLoadingScreenData k = GameLoadingScreenData();

class GameLoadingScreen extends StatefulWidget {
  @override
  _GameLoadingScreenState createState() => _GameLoadingScreenState();
}

class _GameLoadingScreenState extends State<GameLoadingScreen> {
  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.thevirustracker.com/free-api?countryTimeline=IN');
    var graphData = await networkHelper.getData();
    for (DateTime date1 = DateTime(2020, 2, 01);
        date1.isBefore(currentDate);
        date1 = date1.add(Duration(days: 1))) {
      print('andar');
      if (date1.day < 10) {
        await totalData.add(graphData['timelineitems'][0]
            ['${date1.month}/0${date1.day}/20']['total_cases']);
      } else {
        await totalData.add(graphData['timelineitems'][0]
            ['${date1.month}/${date1.day}/20']['total_cases']);
      }
    }
    print('bahar');

    Navigator.push(context, MaterialPageRoute(builder: (context) => Codiv()));
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
