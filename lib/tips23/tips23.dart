// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home.dart';
import 'package:flutter_30_tips/tips8/showCase.dart';

class Tips23 extends StatefulWidget {
  const Tips23({Key? key}) : super(key: key);

  @override
  State<Tips23> createState() => _Tips23State();
}

class _Tips23State extends State<Tips23> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Tips 23"),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      " Without Rotation",
                      style: context.text.headline1!.copyWith(
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                  Center(child: _widget()),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Quartered Rotation",
                            style: context.text.headline4!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                          _rotatedByQuarter(1),
                          _rotatedByQuarter(2),
                          _rotatedByQuarter(3),
                          _rotatedByQuarter(4),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Angled Rotation",
                            style: context.text.headline4!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.poppins().fontFamily),
                          ),
                          _rotatedBydegree(0),
                          _rotatedBydegree(15),
                          _rotatedBydegree(30),
                          _rotatedBydegree(40),
                        ],
                      ),
                    ],
                  ),
                ])));
  }

  Widget _widget() {
    return Icon(
      Icons.thumb_down,
      size: 55,
      color: mainColor,
    );
  }

  Widget _rotatedByQuarter(int turn) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: turn,
          child: _widget(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Rotated $turn quarter turn",
          style: context.text.headline4!.copyWith(
              fontSize: 15, fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _rotatedBydegree(double turn) {
    return Column(
      children: [
        Transform.rotate(
          angle: turn,
          child: _widget(),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Rotated $turn quarter turn",
          style: context.text.headline4!.copyWith(
              fontSize: 15, fontFamily: GoogleFonts.poppins().fontFamily),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
