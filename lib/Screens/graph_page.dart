import 'package:flutter/material.dart';
import 'graph.dart';
// import 'game_loading_screen.dart';


class GraphPage extends StatefulWidget {
  GraphPage(this.totalCasesData, this.totalRecoveriesData, this.totalDeathsData);
  final totalCasesData;
  final totalRecoveriesData;
  final totalDeathsData;
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: LineChartSample1(widget.totalCasesData, widget.totalRecoveriesData, widget.totalDeathsData),
          ),
        ),
      ),
    );
  }
}
