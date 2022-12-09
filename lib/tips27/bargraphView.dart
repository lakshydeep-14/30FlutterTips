import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraphView extends StatefulWidget {
  const BarGraphView({super.key});

  @override
  State<BarGraphView> createState() => _BarGraphViewState();
}

class _BarGraphViewState extends State<BarGraphView> {
  TooltipBehavior _tooltip = TooltipBehavior(enable: true);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          "Bar Graph",
          style: context.text.headline2!.copyWith(),
        ),
        SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 1500, interval: 100),
            tooltipBehavior: _tooltip,
            series: <ChartSeries<_ChartData, String>>[
              ColumnSeries<_ChartData, String>(
                  dataSource: [
                    _ChartData("LinkedIN", 600),
                    _ChartData("Medium", 250),
                    _ChartData("GitHub", 1094)
                  ],
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y,
                  name: 'Followers',
                  color: mainColor)
            ]),
      ],
    ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
