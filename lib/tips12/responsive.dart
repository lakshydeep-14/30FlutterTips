// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';
import 'package:flutter_30_tips/tips12/responsive_builder_screen.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'layout_builder_screen.dart';

class ResponsivenessWid extends StatefulWidget {
  const ResponsivenessWid({Key? key}) : super(key: key);

  @override
  State<ResponsivenessWid> createState() => _ResponsivenessWidState();
}

class _ResponsivenessWidState extends State<ResponsivenessWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 12"),
      body: ListView(children: [
        _irresponsive(),
        Row(
          children: [
            ...List.generate(10, (index) => _a(index.toString())),
          ],
        ),
        _responsive("Wrap"),
        Wrap(
          children: [
            ...List.generate(10, (index) => _a(index.toString())),
          ],
        ),
        _irresponsive(),
        Row(
          children: [
            ...List.generate(10, (index) => _a(index.toString())),
          ],
        ),
        _responsive("ListView horizontally"),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(10, (index) => _a(index.toString())),
            ],
          ),
        ),
        _responsive("0.1* MediaQuery by height"),
        Container(
          height: 0.1 * MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: mainColor,
          child: Center(child: Text('0.1* MediaQuery by height')),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  color: Colors.red,
                  height: 100,
                  child: _responsive("Expanded")),
            ),
            Flexible(
              child: Container(
                  color: Colors.yellow,
                  height: 100,
                  child: _responsive("Flexible")),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  color: Colors.red,
                  height: 100,
                  child: _responsive("Expanded")),
            ),
            Flexible(
              child: Container(
                  color: Colors.yellow,
                  height: 100,
                  child: _responsive("Flexible")),
            ),
          ],
        ),
        AspectRatio(
          aspectRatio: 16 / 4,
          child: Container(
            color: mainColor.withOpacity(0.5),
            child: _responsive("Aspectratio 16/4"),
          ),
        ),
        AspectRatio(
          aspectRatio: 5 / 4,
          child: Container(
            color: mainColor.withOpacity(0.75),
            child: _responsive("Aspectratio 5/4"),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              Get.to(() => LayoutBuilderScreen());
            },
            child: Text("Layout Builder")),
        ElevatedButton(
            onPressed: () {
              Get.to(() => ResScreen());
            },
            child: Text("Responsive Builder"))
      ]),
    );
  }

  Widget _irresponsive() {
    return Text(
      "Irresponsive",
      style: context.text.headline3!.copyWith(
          color: mainColor.withOpacity(0.89),
          fontFamily: GoogleFonts.sansita().fontFamily),
    );
  }

  Widget _responsive(String a) {
    return Text(
      "Responsive Using $a",
      style: context.text.headline3!.copyWith(
          color: mainColor.withOpacity(0.89),
          fontFamily: GoogleFonts.sansita().fontFamily),
    );
  }

  Widget _a(String e) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 100,
      // height: 50,
      child: Text(
        e,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
