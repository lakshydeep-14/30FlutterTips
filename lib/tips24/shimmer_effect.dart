// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatefulWidget {
  const ShimmerEffect({super.key});

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  bool loading1 = true;
  bool loading2 = true;
  bool loading3 = true;
  bool loading4 = true;
  bool loading5 = true;
  bool loading6 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading1();
  }

  _loading1({int sec = 2}) {
    Future.delayed(Duration(seconds: sec)).then((value) {
      setState(() {
        loading1 = false;
      });
    });
    Future.delayed(Duration(seconds: sec + 2)).then((value) {
      setState(() {
        loading2 = false;
      });
    });
    Future.delayed(Duration(seconds: sec + 5)).then((value) {
      setState(() {
        loading3 = false;
      });
    });
    Future.delayed(Duration(seconds: sec + 7)).then((value) {
      setState(() {
        loading4 = false;
      });
    });
    Future.delayed(Duration(seconds: sec + 9)).then((value) {
      setState(() {
        loading5 = false;
      });
    });
    Future.delayed(Duration(seconds: sec + 11)).then((value) {
      setState(() {
        loading6 = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 23"),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextButton.icon(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all(mainColor)),
                      onPressed: () {
                        setState(() {
                          loading1 = true;
                          loading2 = true;
                          loading3 = true;
                          loading4 = true;
                          loading5 = true;
                          loading6 = true;
                        });
                        _loading1();
                      },
                      icon: Icon(Icons.refresh),
                      label: Text("Reload")),
                ),
                SizedBox(
                  height: 50,
                ),
                _widget(loading1, "Follow #30FlutterTips"),
                _widget(loading2, "On"),
                _widget(loading3, "YouTube: @gowithflutter"),
                _widget(loading4, "Github: lakshydeep-14"),
                _widget(loading5, "Medium: lakshydeep-14"),
                _widget(loading6, "LinkedIn: lakshydeep-14"),
              ],
            )));
  }

  Widget _widget(bool loader, String label) {
    return loader
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: 80,
              width: double.infinity,
              child: Card(
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(height: 80),
              ),
            ))
        : Text(
            label,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w900, color: mainColor),
          );
  }
}
