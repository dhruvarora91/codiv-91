import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'game_loading_screen.dart';
import 'package:flutter/cupertino.dart';

int totalCases, totalRecoveries, totalDeaths;
var Maxy;
// GameLoadingScreenData glsd = GameLoadingScreenData();

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
    GD = graphData.TotalCases;

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

  List<String> graphList = ['Total Cases', 'Recovered Cases', 'Deaths', 'All'];

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
                    const Text(
                      'Unfold Shop 2018',
                      style: TextStyle(
                        color: Color(0xff827daa),
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Monthly Sales',
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
//                IconButton(
//                  icon: Icon(
//                    Icons.refresh,
//                    color:
//                        Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
//                  ),
//                  onPressed: () {
//                    setState(() {
//                      isShowingMainData = !isShowingMainData;
//                    });
//                  },
//                )
              ],
            ),
          ),
        ),
        Container(
          height: 150.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 30.0),
          color: Colors.lightBlue,
          child: CupertinoPicker(
            backgroundColor: Colors.lightBlue,
            itemExtent: 32.0,
            onSelectedItemChanged: (selectedIndex) {
              print(selectedIndex);
              setState(() {
                switch (selectedIndex) {
                  case 0:
                    GD = graphData.TotalCases;
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
                    GD = graphData.All;
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
      colors: [
        const Color(0xff4af699),
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
      colors: [
        const Color(0xffaa4cfc),
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
        Color(0xff27b6fc),
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

//  LineChartData TotalCases() {
//    return LineChartData(
//      lineTouchData: LineTouchData(
//        touchTooltipData: LineTouchTooltipData(
//          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//        ),
//        touchCallback: (LineTouchResponse touchResponse) {},
//        handleBuiltInTouches: true,
//      ),
//      gridData: FlGridData(
//        show: false,
//      ),
//      titlesData: FlTitlesData(
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 22,
//          textStyle: const TextStyle(
//            color: Color(0xff72719b),
//            fontWeight: FontWeight.bold,
//            fontSize: 16,
//          ),
//          margin: 10,
//          getTitles: (value) {
//            return '';
//          },
//        ),
//        leftTitles: SideTitles(
//          showTitles: true,
//          textStyle: const TextStyle(
//            color: Color(0xff75729e),
//            fontWeight: FontWeight.bold,
//            fontSize: 14,
//          ),
//          getTitles: (value) {
//            return '';
//          },
//          margin: 8,
//          reservedSize: 30,
//        ),
//      ),
//      borderData: FlBorderData(
//        show: true,
//        border: const Border(
//          bottom: BorderSide(
//            color: Color(0xff4e4965),
//            width: 4,
//          ),
//          left: BorderSide(
//            color: Colors.transparent,
//          ),
//          right: BorderSide(
//            color: Colors.transparent,
//          ),
//          top: BorderSide(
//            color: Colors.transparent,
//          ),
//        ),
//      ),
//      minX: 0,
//      maxX: widget.totalCasesData.length.toDouble(),
//      maxY: widget.totalCasesData[widget.totalCasesData.length - 1].toDouble(),
//      minY: 0,
//      lineBarsData: TotalCasesData(),
//    );
//  }

  List<LineChartBarData> TotalCasesData() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: totalCasesList,
//      [
//
////        FlSpot(1, 8),
////        FlSpot(3, 1.5),
////        FlSpot(5, 1.4),
////        FlSpot(7, 3.4),
////        FlSpot(10, 2),
////        FlSpot(12, 2.2),
////        FlSpot(13, 1.8),
//      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
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

//  LineChartData Deaths() {
//    return LineChartData(
//      lineTouchData: LineTouchData(
//        touchTooltipData: LineTouchTooltipData(
//          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//        ),
//        touchCallback: (LineTouchResponse touchResponse) {},
//        handleBuiltInTouches: true,
//      ),
//      gridData: FlGridData(
//        show: false,
//      ),
//      titlesData: FlTitlesData(
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 22,
//          textStyle: const TextStyle(
//            color: Color(0xff72719b),
//            fontWeight: FontWeight.bold,
//            fontSize: 16,
//          ),
//          margin: 10,
//          getTitles: (value) {
//            return '';
//          },
//        ),
//        leftTitles: SideTitles(
//          showTitles: true,
//          textStyle: const TextStyle(
//            color: Color(0xff75729e),
//            fontWeight: FontWeight.bold,
//            fontSize: 14,
//          ),
//          getTitles: (value) {
//            return '';
//          },
//          margin: 8,
//          reservedSize: 30,
//        ),
//      ),
//      borderData: FlBorderData(
//        show: true,
//        border: const Border(
//          bottom: BorderSide(
//            color: Color(0xff4e4965),
//            width: 4,
//          ),
//          left: BorderSide(
//            color: Colors.transparent,
//          ),
//          right: BorderSide(
//            color: Colors.transparent,
//          ),
//          top: BorderSide(
//            color: Colors.transparent,
//          ),
//        ),
//      ),
//      minX: 0,
//      maxX: widget.totalDeathsData.length.toDouble(),
//      maxY:
//          widget.totalDeathsData[widget.totalDeathsData.length - 1].toDouble(),
//      minY: 0,
//      lineBarsData: DeathsData(),
//    );
//  }

  List<LineChartBarData> DeathsData() {
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: totalDeathsList,
//      [
//        FlSpot(1, 1),
//        FlSpot(3, 2.8),
//        FlSpot(7, 1.2),
//        FlSpot(10, 2.8),
//        FlSpot(12, 2.6),
//        FlSpot(13, 3.9),
//      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
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

//  LineChartData RecoveredCases() {
//    return LineChartData(
//      lineTouchData: LineTouchData(
//        touchTooltipData: LineTouchTooltipData(
//          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//        ),
//        touchCallback: (LineTouchResponse touchResponse) {},
//        handleBuiltInTouches: true,
//      ),
//      gridData: FlGridData(
//        show: false,
//      ),
//      titlesData: FlTitlesData(
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 22,
//          textStyle: const TextStyle(
//            color: Color(0xff72719b),
//            fontWeight: FontWeight.bold,
//            fontSize: 16,
//          ),
//          margin: 10,
//          getTitles: (value) {
//            return '';
//          },
//        ),
//        leftTitles: SideTitles(
//          showTitles: true,
//          textStyle: const TextStyle(
//            color: Color(0xff75729e),
//            fontWeight: FontWeight.bold,
//            fontSize: 14,
//          ),
//          getTitles: (value) {
//            return '';
//          },
//          margin: 8,
//          reservedSize: 30,
//        ),
//      ),
//      borderData: FlBorderData(
//        show: true,
//        border: const Border(
//          bottom: BorderSide(
//            color: Color(0xff4e4965),
//            width: 4,
//          ),
//          left: BorderSide(
//            color: Colors.transparent,
//          ),
//          right: BorderSide(
//            color: Colors.transparent,
//          ),
//          top: BorderSide(
//            color: Colors.transparent,
//          ),
//        ),
//      ),
//      minX: 0,
//      maxX: widget.totalRecoveriesData.length.toDouble(),
//      maxY: widget.totalRecoveriesData[widget.totalCasesData.length - 1]
//          .toDouble(),
//      minY: 0,
//      lineBarsData: RecoveredCasesData(),
//    );
//  }

  List<LineChartBarData> RecoveredCasesData() {
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: totalRecoveryList,
//      [
//        FlSpot(1, 2.8),
//        FlSpot(3, 1.9),
//        FlSpot(6, 3),
//        FlSpot(10, 1.3),
//        FlSpot(13, 2.5),
//      ],
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
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
