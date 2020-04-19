import 'package:flutter/material.dart';
import 'graph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:codiv91/Services/Network_Helper.dart';
// import 'game_loading_screen.dart';

DateTime currentDate = DateTime.now().add(Duration(days: -2));

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

   Future getData() async {
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
    Map data = {
      'total' : totalCases,
      'recovered' : totalRecovered,
      'deaths' : totalDeaths,
    };
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
 if(snapshot.data == null) {
   return Container(
      child: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
      } else {
      
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: LineChartSample1(snapshot.data['total'], snapshot.data['recovered'], snapshot.data['deaths']),
          ),
        ),
      ),
    );
  }
      },
     
    );
    }
}
