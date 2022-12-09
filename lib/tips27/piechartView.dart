import 'package:flutter/material.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

import 'package:pie_chart/pie_chart.dart';

class PieChartWid extends StatefulWidget {
  const PieChartWid({super.key});

  @override
  State<PieChartWid> createState() => _PieChartWidState();
}

class _PieChartWidState extends State<PieChartWid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Bar Graph",
          style: context.text.headline2!.copyWith(),
        ),
        SizedBox(
          height: 20,
        ),
        PieChart(
          dataMap: const {
            "LinkedIn": 700,
            "GitHub": 1000,
            "Medium": 250,
          },
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.height * 0.25,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          centerText: "Followers",
          ringStrokeWidth: 32,
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 2,
          ),
          legendOptions: const LegendOptions(
            showLegendsInRow: true,
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
