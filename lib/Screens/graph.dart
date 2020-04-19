import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

int totalCases, totalRecoveries, totalDeaths;
var Maxy;

enum graphData { TotalCases, RecoveredCases, Deaths, All }
graphData GD;

List<FlSpot> totalCasesList = [];
List<FlSpot> totalDeathsList = [];
List<FlSpot> totalRecoveryList = [];

class LineChartSample1 extends StatefulWidget {
  LineChartSample1(
      this.totalCasesData, this.totalRecoveriesData, this.totalDeathsData);
  final totalCasesData;
  final totalRecoveriesData;
  final totalDeathsData;

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  void initState() {
    super.initState();
    GD = graphData.All;

    updateUI(widget.totalCasesData, widget.totalRecoveriesData,
        widget.totalDeathsData);
  }

  void updateUI(totalCasesData, totalRecoveriesData, totalDeathsData) {
    totalCasesList = [];
    totalDeathsList = [];
    totalRecoveryList = [];

    for (var i = 0; i < widget.totalCasesData.length; i++) {
      totalCasesList
          .add(FlSpot(i.toDouble(), widget.totalCasesData[i].toDouble()));
      totalDeathsList
          .add(FlSpot(i.toDouble(), widget.totalDeathsData[i].toDouble()));
      totalRecoveryList
          .add(FlSpot(i.toDouble(), widget.totalRecoveriesData[i].toDouble()));
    }
  }

  List<String> graphList = ['All', 'Recovered Cases', 'Deaths', 'Total Cases'];

  List<Widget> getPickerItems() {
    List<Text> pickerItems = [];
    for (String graph in graphList) {
      var newItem = Text(graph);
      pickerItems.add(newItem);
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        AspectRatio(
            aspectRatio: 0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                gradient: LinearGradient(
        colors: const [
          Color(0xff2c274c),
          Color(0xff46426c),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 37,
            ),
            // const Text(
            //   'Unfold Shop 2018',
            //   style: TextStyle(
            //     color: Color(0xff827daa),
            //     fontSize: 16,
            //   ),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Cases',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 37,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                child: LineChart(
                  All(),
                  swapAnimationDuration:
                      const Duration(milliseconds: 250),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
                ],
              ),
            ),
          ),
        Container (
          child: Column(children: <Widget>[
          Text('Total Infected Cases', style: TextStyle(color: Colors.blue, fontSize: 25.0)),
          Text('Total Recovered Cases', style: TextStyle(color: Colors.green, fontSize: 25.0)),
          Text('Total Death Cases', style: TextStyle(color: Colors.red, fontSize: 25.0)),
        ],),),
        Container(
          height: 200.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 30.0),
          color: Colors.cyan[700],
          
          child: CupertinoPicker(
            useMagnifier: true,
            magnification: 2.0,
            backgroundColor: Colors.cyan[700],
            itemExtent: 32.0,
            onSelectedItemChanged: (selectedIndex) {
              print(selectedIndex);
              setState(() {
                switch (selectedIndex) {
                  case 0:
                    
                    GD = graphData.All;
                    Maxy = widget
                        .totalCasesData[widget.totalCasesData.length - 1]
                        .toDouble();
                    break;
                  case 1:
                    GD = graphData.RecoveredCases;
                    Maxy = widget.totalRecoveriesData[
                            widget.totalRecoveriesData.length - 1]
                        .toDouble();
                    break;
                  case 2:
                    GD = graphData.Deaths;
                    Maxy = widget
                        .totalDeathsData[widget.totalDeathsData.length - 1]
                        .toDouble();
                    break;
                  case 3:
                    GD = graphData.TotalCases;
                    Maxy = widget
                        .totalCasesData[widget.totalCasesData.length - 1]
                        .toDouble();
                    

                    break;
                }
              });
            },
            children: getPickerItems(),
          ),
        ),
      ],
    );
  }

  List<LineChartBarData> setData(graphData GD) {
    switch (GD) {
      case graphData.All:
        return AllData();
      case graphData.TotalCases:
        return TotalCasesData();
      case graphData.Deaths:
        return DeathsData();
      case graphData.RecoveredCases:
        return RecoveredCasesData();
    }
  }

  LineChartData All() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: widget.totalCasesData.length.toDouble(),
      maxY: Maxy,
      minY: 0,
      lineBarsData: setData(GD),
    );
  }

  List<LineChartBarData> AllData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: totalCasesList,
      isCurved: true,
      colors: const [
         Colors.blue,  // total 0xff4af699
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: totalDeathsList,
      isCurved: true,
      colors: const [
         Colors.red, // deaths  0xffaa4cfc
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: totalRecoveryList,
      isCurved: true,
      colors: const [
        Colors.green // recoveries 0xff27b6fc
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }

  List<LineChartBarData> TotalCasesData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: totalCasesList,
      isCurved: true,
      colors: const [
         Colors.blue,
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );

    return [
      lineChartBarData1,
    ];
  }

  List<LineChartBarData> DeathsData() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: totalDeathsList,
      isCurved: true,
      colors: const[
         Colors.red,
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );

    return [
      lineChartBarData2,
    ];
  }



  List<LineChartBarData> RecoveredCasesData() {
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: totalRecoveryList,
      isCurved: true,
      colors: const [
        Colors.green,
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData3,
    ];
  }
}
