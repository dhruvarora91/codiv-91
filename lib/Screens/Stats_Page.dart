import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants.dart';
import 'package:codiv91/Services/Network_Helper.dart';

class MainScreen extends StatefulWidget {
  // MainScreen(this.dataGlobal, this.dataIndia);
  // final dataGlobal;
  // final dataIndia;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int totalCases,
      totalNewCasesToday,
      totalNewDeathsToday,
      totalDeath,
      totalCasesIndia,
      totalNewIndiaCasesToday,
      totalDeathIndia,
      totalNewDeathsTodayIndia,
      totalActiveCases;

  @override
  void initState() {
    super.initState();
    getData();
    // updateUI(widget.dataGlobal, widget.dataIndia);
    // updateUI(getData()[0], getData()[1]);
  }

   Future getData() async {
    NetworkHelper covidDataGlobal = NetworkHelper('https://thevirustracker.com/free-api?global=stats');
    NetworkHelper covidDataIndia = NetworkHelper('https://thevirustracker.com/free-api?countryTotal=IN');
    var dataGlobal = await covidDataGlobal.getData();
    var dataIndia = await covidDataIndia.getData();
    // List data = [dataGlobal, dataIndia];
    // print(data);
    // return data;
    // setState(() {
      // print(dataGlobal);
      // print(dataIndia);
      totalCases = dataGlobal['results'][0]['total_cases'];
      totalNewCasesToday = dataGlobal['results'][0]['total_new_cases_today'];
      totalNewDeathsToday = dataGlobal['results'][0]['total_new_deaths_today'];
      totalDeath = dataGlobal['results'][0]['total_deaths'];
      totalCasesIndia = dataIndia["countrydata"][0]["total_cases"];
      totalNewIndiaCasesToday = dataIndia["countrydata"][0]["total_new_cases_today"];
      totalDeathIndia = dataIndia["countrydata"][0]["total_deaths"];
      totalNewDeathsTodayIndia = dataIndia["countrydata"][0]["total_new_deaths_today"];
      totalActiveCases = dataIndia["countrydata"][0]["total_active_cases"];
      Map data = {
        'Global': dataGlobal,
        'India' : dataIndia,
      };
      return data;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.data == null) {
        print('In if : ${snapshot.data}');
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
      } else {
        print('In else : ${snapshot.data}');
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kCardColorStats,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Total Cases', style: kLabelTextSize),
                            Text('${totalCases.toString()}',
                                style: kNumberTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          color: kCardColorStats,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New cases', style: kLabelSubTextSize),
                            Text('${totalNewCasesToday.toString()}',
                                style: kNumberSubTextStyle),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.0),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kCardColorStats,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Total deaths today',
                                style: kLabelSubTextSize),
                            Text('${totalNewDeathsToday.toString()}',
                                style: kNumberSubTextStyle),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.0),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: kCardColorStats,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Total deaths', style: kLabelSubTextSize),
                            Text('${totalDeath.toString()}',
                                style: kNumberSubTextStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: kCardColorIndia,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Row(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('India', style: kLabelIndia),
                                    ),
                                  ]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('Total cases: ',
                                          style: kNumberIndiaSubTextStyle),
                                      Text('${totalCasesIndia.toString()}',
                                          style: kNumberIndiaSubTextStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('New cases: ',
                                          style: kNumberIndiaSubTextStyle),
                                      Text(
                                          '${totalNewIndiaCasesToday.toString()}',
                                          style: kNumberIndiaSubTextStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('Total deaths: ',
                                          style: kNumberIndiaSubTextStyle),
                                      Text('${totalDeathIndia.toString()}',
                                          style: kNumberIndiaSubTextStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('Deaths today: ',
                                          style: kNumberIndiaSubTextStyle),
                                      Text(
                                          '${totalNewDeathsTodayIndia.toString()}',
                                          style: kNumberIndiaSubTextStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text('Active cases: ',
                                          style: kNumberIndiaSubTextStyle),
                                      Text('${totalActiveCases.toString()}',
                                          style: kNumberIndiaSubTextStyle),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      }
    });
  }
}
