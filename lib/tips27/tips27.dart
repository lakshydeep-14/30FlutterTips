import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips27/piechartView.dart';
import 'bargraphView.dart';

class Tips27 extends StatefulWidget {
  const Tips27({super.key});

  @override
  State<Tips27> createState() => _Tips27State();
}

class _Tips27State extends State<Tips27> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 27"),
      body: Column(children: const [
        PieChartWid(),
        SizedBox(
          height: 50,
        ),
        BarGraphView()
      ]),
    );
  }
}
